---
date: "2007-03-06T00:00:00Z"
tags: b/编程/3/b
title: ii undefined symbol cairo_xlib_surface_create
---

第二次遇到这样的错误：

    [/sun/home]% firefox
    /usr/lib/firefox/firefox-bin: symbol lookup error: /usr/lib/libgdk-x11-2.0.so.0: undefined symbol: cairo_xlib_surface_create

上次是因为 ld.so.conf 的设置问题，这次是因为我编译 cairo-1.2.4 的问题。我在编译时忘记指定 prefix，它把 libcairo.so 默认安装到 /lib 目录，导致 gtk 程序启动时加载了错误的 libcairo.so 库

解决办法是，重新编译 cairo-1.2.4，同样不要指定 prefix，然后安装，最后再反安装。

    1% ./configure [原先的参数]
    2% make
    3% sudo make install
    4% sudo make uninstall
