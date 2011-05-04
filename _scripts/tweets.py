#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: set noexpandtab:

import json
import urllib
import urllib2
import base64
import time
import sys
import os
import re
from datetime import datetime

default_encoding = 'utf-8'
if sys.getdefaultencoding() != default_encoding:
	reload(sys)
	sys.setdefaultencoding(default_encoding)

def ftime(f_tick):
	tick = datetime(*time.strptime(f_tick[:20], '%Y-%m-%dT%H:%M:%SZ')[:6])
	diff = datetime.now() - tick

	if diff.days < 1:
		if diff.seconds < 3600:  return 'less than an hour ago'
		elif diff.seconds < 7200: return 'about an hour ago';
		elif diff.seconds < 36000: return 'about %d hours ago' % (diff.seconds / 60 / 60)
		else: return 'less than a day ago'
	elif diff.days < 2: return 'about a day ago'
	else: return 'about %d days ago' % diff.days

def main():
	url = "http://friendfeed-api.com/v2/feed/s5unty?num=5"
	html = '/sun/blog/site/index.html'
	feed = json.load(urllib.urlopen(url))
	this = ""
	for item in feed['entries']:
		body = item['body']
		tick = item['date']
		when = ftime(tick)
		url = item['via']['url']
		via = item['via']['name']

		head = '<span id="tweets">%s</span>' % (body)
		foot = '<span id="tweets_time">%s, <a rel="nofollow" href="%s">%s</a></span>' % (when, url, via)
		if (body[0] == '@'):
			continue
		this += '<p>\n%s\n</br>\n%s\n</p>' % (head, foot)
	#print this 

	data = open(html).read()
	# python-2.6 的 sub 不支持 flag
	comp = re.compile('(<!-- __tweets_begin__ -->).*(<!-- __tweets_end__ -->)', re.S)
	data = comp.sub('\\1\n'+this+'\n\\2', data)
	open(html, 'wb').write(data)

if __name__ == "__main__":
    main()
