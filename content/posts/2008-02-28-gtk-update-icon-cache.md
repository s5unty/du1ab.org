---
date: "2008-02-28T00:00:00Z"
tags: b/编程/3/d
title: gtk-update-icon-cache
---

GTK+ can use the cache files created by **gtk-update-icon-cache** to avoid a lot of system call and disk
seek overhead when the application starts. Since the format of the cache files allows them to be
mmap()ed shared between multiple applications, the overall memory consumption is reduced as well.
 
