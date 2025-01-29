---
date: "2012-03-31T00:00:00Z"
tags: cmd/tar
title: 提取tgz里面的tgz里面的tgz
---

假设有foo.tgz文件内容如下：

    foo.tgz/
        foo/1
        foo/2.tgz
        foo/3

假设其中2.tgz文件内容如下：

    2.tgz/
        2/a
        2/b
        2/c.tgz

如果想要直接操作ccc.tgz文件，可以：
    
                                          vvvvv<4>
    tar zxvfO foo.tgz 2.tgz | tar zxvfO - c.tgz | tar ztvf - | more
            ^<1>      ^^^^^<2>          ^<3>               ^<5>

1. 解压出的内容交给stdout
2. 单独提取个别文件(2.tgz)
3. 从stdout获取内容(2.tgz)
4. 单独提取个别文件(c.tgz)
5. 从stdout获取内容(c.tgz)
