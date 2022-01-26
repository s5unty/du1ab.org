---
categories:
- bin
date: "2008-06-09T00:00:00Z"
tags:
- go
title: linux 下最好的围棋软件 glgo
---

主页 http://www.pandanet.co.jp/English/glgo/download.html

Debian 下的围棋软件我试了源里面自带的 quarry 和 qgo，不过它们各自都有很大的缺点
，quarry 不支持 IGS，qgo 的对弈续盘功能作的似乎有问题: 当你想加载上次未和 gnugo
下完的对局继续战斗时，你会发现 gnugo 有点失常 ── 不走棋、瞎走棋、甚至直接认输。

由于 glGo 的版权问题(开发者保留版权)，不能直接从源安装。到其主页下载预编译好的
二进制包，它的 DEB 包在我的 etch 上直接 dpkg 安装没有遇到任何依赖关系问题，装好
以后分别把这些 sdl 库再装上，这样就 ok 了:
    libsdl-image1.2
    libsdl-mixer1.2
    libsdl-sound1.2
    libsdl-ttf2.0-0
    libsdl1.2debian-all

很欣赏它的 3D 效果(显卡驱动很重要)，截图一张:
![](http://bp2.blogger.com/_oKL9t7fM3TU/SE0p5hltARI/AAAAAAAAAas/YBLHHGy4rr0/s400/glGo.png)
