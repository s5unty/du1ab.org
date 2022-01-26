---
categories:
- var
date: "2007-01-28T00:00:00Z"
tags: []
title: 在firefox中关联ed2k文件类型
---

FROM: <http://www.surfchen.org/?p=169>

在firefox地址栏中输入about:config

右键新建一个Boolean，名为network.protocol-handler.external.ed2k，值为true

右键新建一个String，名为network.protocol-handler.app.ed2k，值为/usr/bin/ed2k（使用which ed2k命令确认）

这样就OK了。这时候点击一个ed2k链接将会出现一个启动相应应用程序的提示。点击启动后， 这个ed2k链接将会被加入下载队列。前提是amule必须是已经开启着的。

如果你想在点一个ed2k链接的时候不出现提示，那么新建一个Boolean,名字为network.protocol-handler.warn-external.ed2k，值为false
