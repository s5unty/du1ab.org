---
categories:
- var
date: "2007-02-07T00:00:00Z"
tags: []
title: 在fish里用find命令的 exec参数时
---

find -type f -exec dpkg -c "{}" \; | grep iso

为{}添加一对双引号，以前在bash下没有这个习惯
