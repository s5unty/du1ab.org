---
date: "2007-08-15T00:00:00Z"
tags: dev/gdb
title: 'GDB: No symbol in current context.'
---

FROM: <http://developer.apple.com/documentation/DeveloperTools/gdb/gdb/gdb_9.html>

用gdb调一个程序，打印某变量的时候看到这样的提示：

    (gdb) p DevInfo->bSelected
    No symbol "DevInfo" in current context.

解决办法是添加 -gstabs 参数。


