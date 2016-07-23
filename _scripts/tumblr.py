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
import pytumblr
from datetime import datetime, timedelta


default_encoding = 'utf-8'
if sys.getdefaultencoding() != default_encoding:
	reload(sys)
	sys.setdefaultencoding(default_encoding)

def ftime(f_tick):
	tick = datetime(*time.strptime(f_tick, '%Y-%m-%d %H:%M:%S %Z')[:6])
	tick = tick + timedelta(hours=8) # timezone +0800
	diff = datetime.now() - tick

	if diff.days < 1:
		if diff.seconds < 7200: return 'about an hour ago';
		elif diff.seconds < 72000: return 'about %d hours ago' % (diff.seconds / 60 / 60)
		else: return 'less than a day ago'
	elif diff.days < 2: return 'about a day ago'
	else: return 'about %d days ago' % diff.days


def main():
	client = pytumblr.TumblrRestClient(
			'nNtWZG5EcNlM3ky5irNRTyRpTcOHZbylQnXz6vTmLNrCmLPWos',
			'SroCYkVqdelwC6KIttAUtQaLvUYuTlVXhkDJsxHA4mSnFhLMWN',
			'FPmVXH2DXmXIcAInidUvAvRCePw3F3xqvt2MFf9vow8lW9JRFJ',
			'r4tnomikmwm55xJ1HCiyInzsoW79nJLHLIsQMoH66aBMstrlO1')

	feeds=client.posts('s5unty.tumblr.com', limit=5, filter='html')

	html=""
	body=""
	for post in feeds['posts']:
		via = post['type']
		if via == 'chat':
			body = post['body']
		elif via == 'photo':
			body = post['image_permalink']
		elif via == 'link':
			body = post['title']
		elif via == 'quote':
			body = post['text']
		elif via == 'text':
			body = post['body']
		comp = re.compile('^<p>(.*)</p>$', re.S)
		body = comp.sub('\\1', body)

		tick = post['date']
		when = ftime(tick)
		url = post['short_url']

		head  = '<span id="tweets">%s</span>' % (body)
		foot  = '<span id="tweets_time">%s, <a rel="nofollow" href="%s">%s</a></span>' % (when, url, via)
		html += '<p>\n%s\n</br>\n%s\n</p>' % (head, foot)

	page = '/sun/blog/site/index.html'
	data = open(page).read()
	# python-2.6 的 sub 不支持 flag
	comp = re.compile('(<!-- __tumblr_begin__ -->).*(<!-- __tumblr_end__ -->)', re.S)
	data = comp.sub('\\1\n'+html+'\n\\2', data)
	open(page, 'wb').write(data)

if __name__ == "__main__":
    main()
