---
categories:
- var
date: "2007-09-12T00:00:00Z"
tags: []
title: gmail notifier 字体修改
---

[Gmail Notifier](https://addons.mozilla.org/en-US/firefox/addon/173) 身为一款 Firefox 插件(addon)，提供了多帐号来信提醒功能，特别得是包括 Google Apps 帐号。

美中不足的是当鼠标悬停在右下角的 Gmail 图标上时，信息框中的字体偏小，显示的中文字体模糊不清。解决办法如下：

1. 找到 ~/.mozilla/firefox/ 目录下的  gm-notifier.jar 文件
2. 用 unzip 命令解压缩，解压后得到 content/ 和 locale/ 两个目录
3. 编辑 content/gm-notifier/gm-notifier.css 文件，修改 font-size:0.8em; 为 font-size:1em;
4. 编辑 content/gm-notifier/gm-core-overlay.xul 文件，修改 font-size:0.8em ; 为 font-size:1em;
5. 用 zip -r gm-notifier.jar content/ locale/ 命令重新生成 gm-notifier.jar 文件
6. 替换 ~/.mozilla/firefox/ 目录下原来的 gm-notifier.jar 文件
