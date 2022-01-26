---
categories:
- var
date: "2007-09-03T00:00:00Z"
tags: []
title: SlickEdit Tips
---

如何双击右键关闭 标签页 ？

编辑 macros/bufftabs.e 找到：
&nbsp;&nbsp; _menu_insert(menu_handle,0,MF_ENABLED,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "&Save "strip_filename(buf_name,'P'),"buff-menu-save","","",'Save 'buf_name); 
&nbsp;&nbsp; _menu_insert(menu_handle,1,MF_ENABLED,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "&Close "strip_filename(buf_name,'P'),"buff-menu-close","","",'Close 'buf_name);
改成：
&nbsp;&nbsp; _menu_insert(menu_handle,0,MF_ENABLED, 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "&Close "strip_filename(buf_name,'P'),"buff-menu-close","","",'Close 'buf_name);
&nbsp;&nbsp; _menu_insert(menu_handle,1,MF_ENABLED,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "&Save "strip_filename(buf_name,'P'),"buff-menu-save","","",'Save 'buf_name); 


Module -> Load Module -> 找到 bufftabs.e
右键双击某个标签页，试试看
