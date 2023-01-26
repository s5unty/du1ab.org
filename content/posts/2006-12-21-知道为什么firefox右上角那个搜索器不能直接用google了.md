---
date: "2006-12-21T00:00:00Z"
tags: b/谷歌/4
title: 知道为什么firefox右上角那个搜索器不能直接用google了
---

from http://linux.hiweed.com/book/print/1224

> 解决方法很简单，在 `/usr/lib/mozilla-firefox/searchplugins/google.src` 中，找到 `name="Google"`（很好找的:)），把它改为 `name="Google "`。也就是在后面加个空格，然后重新打开firefox，Google搜索可以正常使用了。

