---
categories:
- var
date: "2007-01-13T00:00:00Z"
tags: []
title: 准备用sqlite改进code blocks的auto code completion功能
---

我以前使用SlickEdit开发C++，我觉得它提供的Code Completion功能相当优秀。它有自己的tag文件，分为编译器tag和项目tag。

首次开启SlickEdit时，它会提示用户搜索编译器目录并产生编译器tag，还可以在使用过程中调整编译器tag。新建了工程项目后，它会自动搜索项目的源文件产生项目tag，并且在每次源文件保存时自动更新。

就我所知，大多数Linux下实现Code Completion的开发环境都在使用ctags或类似工具生成的文本文件作为基础，虽然我没有作过测试，但从使用感受来看，反应速度很慢。设想在最坏情况下，程序要遍历整个文本文件。

所以我的直觉告诉我可以用文件型数据库来实现Code Completion功能。因为对于Code Completion功能来说，查询操作是极其频繁的，然而查询功能恰恰是数据库的强项。

目前我已经把文件型数据库的目标锁定在SQLite，它是开源的，并且拥有丰富的资源。以下是SQLite和PostgreSQL在效率上的对比，我看可以满足Code Completion的要求。请见这里：
<http://www.sergeant.org/sqlite_vs_pgsync.html>

唉，谁能帮我翻译成English就好了 ^^
