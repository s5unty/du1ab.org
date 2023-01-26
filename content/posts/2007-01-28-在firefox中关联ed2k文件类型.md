---
categories:
- var
date: "2007-01-28T00:00:00Z"
tags: []
title: 在firefox中关联ed2k文件类型
---

FROM: <http://www.surfchen.org/?p=169>

在 firefox 地址栏中输入 about:config

右键新建一个 Boolean，名为 network.protocol-handler.external.ed2k，值为 true

右键新建一个 String，名为 network.protocol-handler.app.ed2k，值为/usr/bin/ed2k（使用 which ed2k 命令确认）

这样就 OK 了。这时候点击一个 ed2k 链接将会出现一个启动相应应用程序的提示。点击启动后，这个 ed2k 链接将会被加入下载队列。前提是 amule 必须是已经开启着的。

如果你想在点一个 ed2k 链接的时候不出现提示，那么新建一个 Boolean, 名字为 network.protocol-handler.warn-external.ed2k，值为 false
