---
categories:
- var
date: "2006-12-18T00:00:00Z"
tags: []
title: 解决一个pkg config的问题
---

有时候需要使用pkg-config的输出信息作为程序的编译或链接选项，如果你手工执行
pkg-config --list-all

看到如下错误信息：
...
directfb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DirectFB - Graphics and windowing library for the Linux frame buffer device
gnome-vfs-2.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gnome-vfs - The GNOME virtual file-system libraries 
gst-python-0.10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gst-python - Python bindings for GStreamer
cairo-svg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cairo-svg - SVG backend for cairo graphics library
cairo-ps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cairo-ps - PostScript backend for cairo graphics library 
Package 'libdebian-installer' has no Description: field&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <--- 类似于这样<br clear="all">
你需要修改/usr/lib/pkgconfig/libdebian-installer.pc，在其中Name和Version之间增加一行
Description: NULL

保存退出即可。
