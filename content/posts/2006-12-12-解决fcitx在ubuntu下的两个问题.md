---
categories:
- var
date: "2006-12-12T00:00:00Z"
tags: []
title: 解决fcitx在ubuntu下的两个问题
---

按照ubuntu官方wiki教你用simsun美化的教程后，出现了候选字显示为方框的问题：
发现是由/etc/fonts/language-selector.conf这个文件引起的，还原这个文件就解决了fcitx的问题；但是还原后达不到美化的目的，参考<a href="http://s5unty.blogspot.com/2006/12/ubuntusimsun.html">这篇</a>。注意备份

安装fcitx后无法在qt程序中(如psi, bouml)启用的问题 
不要设置这个环境变量QT_IM_MODULE，用export -n QT_IM_MODULE修复即可。因为我们用的是fcitx。如果是用SCIM就刚好相反，必须要设置QT_IM_MODULE。

