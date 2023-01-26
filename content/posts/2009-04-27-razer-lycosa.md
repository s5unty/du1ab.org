---
date: "2009-04-27T00:00:00Z"
tags: b/操作系统/1/c
title: Razer Lycosa
---

几年前买的 Razer Lycosa 键盘，右上角有 6 个功能键，外加1个键盘背景灯开关键

![](http://du1ab.one/images/2009/04/razer.jpg)

一直以来我都认为这 6 个功能键在 GNU/Linux 下没有驱动是无法使用的。不过今天碰巧
看到一篇 <http://stebalien.com/2008/09/linux-razer-lycosa-wtf.html> 帖子，我从
中发现了 xev 这个工具。启动 xev，点击这些个功能键，很幸运，键码都能被捕获，它们
的 keycode 分别是

    162,　164,　LO　174,　176
    144,　153,　GO　　　sw

然后我写了这样的 ~/.xmodmaprc

    keycode 162 = F13
    keycode 164 = F14
    keycode 144 = F15
    keycode 153 = F16
    keycode 174 = F17
    keycode 176 = F18

然后我又在 awesome 的配置文件 ~/.config/awesome/rc.lua 添加了这些键绑定

    table.insert(globalkeys, key({        }, "F13", function () awful.util.spawn("mocp -G") end))
    table.insert(globalkeys, key({        }, "F14", function () awful.util.spawn("mocp -x") end))
    table.insert(globalkeys, key({        }, "F15", function () awful.util.spawn("mocp -r") end))
    table.insert(globalkeys, key({        }, "F16", function () awful.util.spawn("mocp -f") end))
    table.insert(globalkeys, key({        }, "F17", function () awful.util.spawn("mocp -v -5") end))
    table.insert(globalkeys, key({        }, "F18", function () awful.util.spawn("mocp -v +5") end))

相信有了 xev 和 xmodmap，其他多媒体键盘上的功能键也可以很容易的在 GNU/Linux 系
统下正常使用了。
