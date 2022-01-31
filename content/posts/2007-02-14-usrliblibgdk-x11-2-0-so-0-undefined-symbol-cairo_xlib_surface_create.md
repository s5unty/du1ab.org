---
categories:
- var
date: "2007-02-14T00:00:00Z"
tags: []
title: undefined symbol cairo_xlib_surface_create
---

一份 Gtk 代码，分别编译成 X 和 DirectFB 两份程序

    1$ gcc -o gtk_hello hello.c `pkg-config gtk+-2.0 --cflags --libs`
    2$ export LD_LIBRARY_PATH=/usr/gtkdfb/lib; \
    export PKG_CONFIG_PATH=$LD_LIBRARY_PATH/pkgconfig; \
    gcc -o dfb_hello hello.c `pkg-config gtk+-directfb-2.0 --cflags --libs`

运行 gtk_hello 程序时出错：

    ./gtk_hello: symbol lookup error: /usr/lib/libgdk-x11-2.0.so.0: undefined symbol: cairo_xlib_surface_create

我做了以下操作：

    1$ vi /etc/ld.so.conf
    -- 8< ------
    #注释
    #/usr/gtkdfb/lib
    -- 8< ------
    2$ sudo ldconfig
    3$ export LD_LIBRARY_PATH=""; \
    export PKG_CONFIG_PATH=""
    4$ gcc -o gtk_hello hello.c `pkg-config gtk+-2.0 --cflags --libs`
    5$ ./gtk_hello

一切正常

之前出错的原因我估计是，在编译 hello.c 时，系统从 /usr/gtkdfb/lib 中加载了 libcairo 库造成的。
因为在 /usr/gtkdfb/lib 中的 libcairo 是为了 Gtk On DirectFB 而后期编译产生的，肯定和 Gtk On X11 有所区别。
