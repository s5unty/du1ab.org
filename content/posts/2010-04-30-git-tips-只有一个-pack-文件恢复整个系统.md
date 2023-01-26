---
date: "2010-04-30T00:00:00Z"
tags: b/编程/6/c
title: git tips 只有一个 pack 文件恢复整个系统
---

RT @<http://tinyurl.com/2elvsma>

    % git init
    Initialized empty Git repository in /tmp/foo/.git/
    % git unpack-objects < pack-e19ee6f7b6dff4c80b457296d7dd7a583b13c45c.pack
    Unpacking objects: 100% (15/15), done.
    % git fsck
    notice: HEAD points to an unborn branch (master)
    notice: No default references
    dangling commit 418739c92254f3acadedfb648949b3539171b433
    % git update-ref HEAD 418739c92254f3acadedfb648949b3539171b433
