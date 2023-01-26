---
date: "2009-02-27T00:00:00Z"
tags: b/游戏/4
title: 教你试玩 QuakeLive
---

登录官方网站 www.quakelive.com，在上方点击 REGISTER，进入注册页面。
![](http://1.bp.blogspot.com/_oKL9t7fM3TU/Safc-XQK5uI/AAAAAAAAAl8/T9sAPFI7vrs/s400/1.jpg)

然后在首页用刚注册的 id 登录，由于玩家很多，在登录之后很可能你要排队。“Position
in queue: ”后面的数字表示排在你前面的玩家数量，此时不必手动刷新页面，要耐心等待
。
![](http://4.bp.blogspot.com/_oKL9t7fM3TU/Safc-tzsdFI/AAAAAAAAAmE/111j--MHDBU/s400/2.jpg)

当排队结束，你要点击 DOWNLOAD 下载一个名为 QuakeLiveNP.msi 的安装文件，下载完成
后关闭浏览器，运行安装文件，然后重启浏览器，重新排队准备游戏 --*

由于众多玩家中水平差别较大，为了让玩家得到更好的游戏体验，在你第一次进入游戏后
，系统将安排你和 bot 进行一次比赛测试你的 Quake 水平。

一旦你通过了测试练习赛，接下来你就可以和全世界的 Quaker 同台竞技了，gl & hf
![](http://3.bp.blogspot.com/_oKL9t7fM3TU/SafjHpnPx3I/AAAAAAAAAmc/UrnOcofTTms/s400/3.jpg.jpg)

PS: 在你正式游戏之前，你可能要手动更新你的 pb 文件，否则在正式游戏中你会得到以
下错误提示并且被从游戏中踢出：

    Server Disconnected - PunkBuster kicked player "me" (For 0 Minutes)...
    Restriction: Server Communication Failure: PnkBstrB.exe driver failure
    (PnkBstrK.sys) ffab

解决方法如下:

1. 手动关闭 PnkBstrA 服务和 PnkBstrB 服务。(后者可能不存在，没关系)  
2. 在网上下载 pbsvc.exe 并安装  
3. 从这里 http://evenbalance.com/index.php?page=dl-ql.php 下载 wc002042.htm 和
wa001354.htm 这两个文件  
4. 把刚才下载的两个 htm 文件转移到 C:\Documents and
Settings\YOURNAME\Application Data\id Software\quakelive\home\pb\htm\  
(YOURNAME 代表你登录 windows 的用户名)  
5. 手动运行 C:\WINDOWS\system32 目录下的 PnkBstrA 和 PnkBstrB 这两个文件  
6. 手动启动 PnkBstrA 服务和 PnkBstrB 服务。(后者这时候肯定有了)
