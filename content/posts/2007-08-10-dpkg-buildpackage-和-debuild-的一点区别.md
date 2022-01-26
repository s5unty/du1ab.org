---
categories:
- var
date: "2007-08-10T00:00:00Z"
tags: []
title: dpkg buildpackage 和 debuild 的一点区别
---

打包需要使用某个环境变量，如果是使用dpkg-buildpackage，只要终端中定义环境变量，然后执行dpkg-buildpackage即可。
如果是使用debuild，那么在终端中定义的环境变量是无效的，只有在执行debuild时添加-e参数，例如：

    % debuild -e LD_LIBRARY_PATH=/usr/gtkdfb/lib -e PKG_CONFIG_PATH=/usr/gtkdfb/lib/pkgconfg 
