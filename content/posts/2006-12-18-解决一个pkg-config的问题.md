---
date: "2006-12-18T00:00:00Z"
tags: dev
title: 解决一个pkg config的问题
---

有时候需要使用pkg-config的输出信息作为程序的编译或链接选项，如果你手工执行
pkg-config --list-all

看到如下错误信息：

```
...
directfb DirectFB - Graphics and windowing library for the Linux frame buffer device
gnome-vfs-2.0 gnome-vfs - The GNOME virtual file-system libraries 
gst-python-0.10 gst-python - Python bindings for GStreamer
cairo-svg cairo-svg - SVG backend for cairo graphics library
cairo-ps cairo-ps - PostScript backend for cairo graphics library 
Package 'libdebian-installer' has no Description: field <--- 类似于这样<br clear="all">
```

你需要修改 `/usr/lib/pkgconfig/libdebian-installer.pc`，
在其中Name和Version之间增加一行 Description: NULL

保存退出即可。
