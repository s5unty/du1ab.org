---
categories:
- var
date: "2009-02-02T00:00:00Z"
tags:
- flash
title: Iceweasel - 安装 Flash 插件
---

最近以来我的 Iceweasel3 极不稳定，一直没找到原因。后来开始怀疑是 Flash 插件的问
题，这个问题一直让我头疼，今天总算搞清楚了

1. download it from adobe site 
2. tar xf installFlashPlayer.tar.gz (or whatever it is called) 
3. cd to the folder it extracted to 
4. cp libflashplayer.so ~/.mozilla/plugins/
5. chown $USER:$USER ~/.mozilla/plugins/libflashplayer.so

重启 Iceweasel，在地址栏输入 about:plugins 查看已安装的插件信息，如果发现有多个
Flash 插件都被启用，那么删除多余 Flash 插件(即 so 文件)。
 
如果你也因为 Iceweasel 频繁异常退出找不到原因而发愁，不妨输入 about:plugins 确
定不是 Flash 插件混用的问题。

