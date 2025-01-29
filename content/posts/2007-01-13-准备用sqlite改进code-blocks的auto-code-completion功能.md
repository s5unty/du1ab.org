---
date: "2007-01-13T00:00:00Z"
tags: ide/se
title: 准备用sqlite改进code blocks的auto code completion功能
---

我以前使用 SlickEdit 开发 C++，我觉得它提供的 Code Completion 功能相当优秀。它有自己的 tag 文件，分为编译器 tag 和项目 tag。

首次开启 SlickEdit 时，它会提示用户搜索编译器目录并产生编译器 tag，还可以在使用过程中调整编译器 tag。新建了工程项目后，它会自动搜索项目的源文件产生项目 tag，并且在每次源文件保存时自动更新。

就我所知，大多数 Linux 下实现 Code Completion 的开发环境都在使用 ctags 或类似工具生成的文本文件作为基础，虽然我没有作过测试，但从使用感受来看，反应速度很慢。设想在最坏情况下，程序要遍历整个文本文件。

所以我的直觉告诉我可以用文件型数据库来实现 Code Completion 功能。因为对于 Code Completion 功能来说，查询操作是极其频繁的，然而查询功能恰恰是数据库的强项。

目前我已经把文件型数据库的目标锁定在 SQLite，它是开源的，并且拥有丰富的资源。以下是 SQLite 和 PostgreSQL 在效率上的对比，我看可以满足 Code Completion 的要求。请见这里：
<http://www.sergeant.org/sqlite_vs_pgsync.html>

唉，谁能帮我翻译成 English 就好了 ^^
