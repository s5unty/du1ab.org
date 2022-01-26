---
categories:
- var
date: "2006-12-21T00:00:00Z"
tags: []
title: 知道为什么firefox右上角那个搜索器不能直接用google了 qOS4jeiDveebtOaOpeeUqGdvb2dsZeS6hg==
---

from <a href="http://linux.hiweed.com/book/print/1224">http://linux.hiweed.com/book/print/1224</a>

...
解决方法很简单，在/usr/lib/mozilla-firefox/searchplugins/google.src中找到name="Google"（很好找的:)），把它改为<span style="font-family: monospace;"> 
</span>name="Google "
也就是在后面加个空格，然后重新打开firefox，Google搜索可以正常使用了。
...
