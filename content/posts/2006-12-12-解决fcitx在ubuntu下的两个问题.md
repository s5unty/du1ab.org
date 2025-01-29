---
date: "2006-12-12T00:00:00Z"
tags: [im/输入法]
title: 解决fcitx在ubuntu下的两个问题
---

按照 ubuntu 官方 wiki 教你用 simsun 美化的教程后，出现了候选字显示为方框的问题：
发现是由 `/etc/fonts/language-selector.conf` 这个文件引起的，还原这个文件就解决了 fcitx 的问题；但是还原后达不到美化的目的，[参考这篇](http://s5unty.blogspot.com/2006/12/ubuntusimsun.html)。注意备份

安装 fcitx 后无法在 qt 程序中(如 psi, bouml)启用的问题
不要设置这个环境变量 QT_IM_MODULE，用 export -n QT_IM_MODULE 修复即可。
因为我们用的是 fcitx。如果是用 SCIM 就刚好相反，必须要设置 QT_IM_MODULE。

