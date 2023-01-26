---
date: "2007-09-03T00:00:00Z"
tags: b/编辑器/1/m
title: SlickEdit Tips
---

如何双击右键关闭 标签页 ？

编辑 macros/bufftabs.e 找到：

```
   _menu_insert(menu_handle,0,MF_ENABLED,
                "&Save "strip_filename(buf_name,'P'),"buff-menu-save","","",'Save 'buf_name); 
   _menu_insert(menu_handle,1,MF_ENABLED,
                "&Close "strip_filename(buf_name,'P'),"buff-menu-close","","",'Close 'buf_name);
```

改成：
```
   _menu_insert(menu_handle,0,MF_ENABLED, 
                "&Close "strip_filename(buf_name,'P'),"buff-menu-close","","",'Close 'buf_name);
   _menu_insert(menu_handle,1,MF_ENABLED,
                "&Save "strip_filename(buf_name,'P'),"buff-menu-save","","",'Save 'buf_name); 
```

Module -> Load Module -> 找到 bufftabs.e
右键双击某个标签页，试试看
