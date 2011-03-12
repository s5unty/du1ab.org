#!/bin/bash

rt() {
	time=$(date -d "${1}" +%s)
	curr=$(date +%s)
	shift=$(($curr - $time))

	if [ $shift -lt 45 ]; then
		diff="$shift"
		term="second" # 45 秒前
	elif [ $shift -lt 2700 ]; then
		diff="$(($shift / 60))"
		term="minute" # 45 分钟前
	elif [ $shift -lt 64800 ]; then
		diff="$(($shift / 60 / 60))"
		term="hour" # 18 小时前
	elif [ $shift -lt 518400 ]; then
		diff="$(($shift / 60 / 60 / 24))"
		term="day" # 6 天前
	elif [ $shift -lt 1814400 ]; then
		diff="$(($shift / 60 / 60 / 24 / 7))"
		term="week" # 3 周前 (21 天前)
	else
		echo "$(date -d "${1}" +%F)"
		return
	fi

	if [ $diff -gt 1 ]; then
		term=$term"s"
	else
		diff="1"
	fi
	echo "$diff $term ago"
}

xml=$(curl -s --basic 'http://twitter.com/statuses/user_timeline/s5unty.rss?count=1')
date=$(grep pubDate <<< "$xml" | tr -d '\t' | sed 's/^<.*>\([^<].*\)<.*>$/\1/' | sed 's/<pubDate>//' | sed 's/<\/pubDate>//' | sed 's/^ //g')
desc=$(awk -v "tag=description" '$0 ~ tag && a++ { print; exit }' <<< "$xml" | tr -d '\t' | sed 's/^<.*>\([^<].*\)<.*>$/\1/' | sed 's/<description>//' | sed 's/<\/description>//' | sed 's/CorinCole: //' | sed 's/^ //g')
link=$(awk -v "tag=link" '$0 ~ tag && 2 ==   a++ { print; exit }' <<< "$xml" | tr -d '\t' | sed 's/^<.*>\([^<].*\)<.*>$/\1/' | sed 's/<link>//' | sed 's/<\/link>//' | sed 's/^ //g')

date=$(rt "${date}")
desc=$(echo $desc | sed 's|[[:lower:]]\{1,\}://[^[:space:]]\{1,\}|<a href="&">&</a>|g ; s| \(www.[^[:space:]]*\)| <a href="\1">\1</a>|g')
desc=$(echo $desc | sed 's|^s5unty: ||')

read  -rd '' desc <<< "$desc"
read  -rd '' link <<< "$link"

for file in "/sun/blog/site/index.html"
do
	perl -pi -e 'BEGIN { $x = shift; $y = shift; } s/$x/$y/g' -- "<span id=\"tweets\">.*</span>" "<span id=\"tweets\">$desc</span>" $file
	perl -pi -e 'BEGIN { $x = shift; $y = shift; } s/$x/$y/g' -- "<span id=\"tweets_time\">.*</span>" "<span id=\"tweets_time\"><a href=\"$link\">$date</a></span>" $file
done
