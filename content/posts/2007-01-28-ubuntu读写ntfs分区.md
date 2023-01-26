---
date: "2007-01-28T00:00:00Z"
tags: b/文件系统/1
title: ubuntu读写ntfs分区
---

FROM：<http://blog.pixian.org/linux/37/install_ubuntu_ntfs-3g/>

安装必要工具──ntfs-3g

    % sudo apt-get install ntfs-3g

由于ntfs-3g工作环境依赖fuse，确保安装完毕后fuse已正常加载 

    % lsmod | grep fuse

另外为了每次开机都能直接读写ntfs分区，确保/etc/modules文件中存在一行内容为fuse的记录。

    % cat /etc/modules

修改/etc/fstab，使用ntfs-3g替换原ntfs，并添加locale=zh_CN.UTF8

    % sudo vi /etc/fstab
    /dev/hda6   /media/win_e    ntfs-3g    defaults,nls=utf8,umask=007,gid=46,locale=zh_CN.UTF8 0 1

重启机器，或者执行以下命令立即执行

    % sudo umount -a
    % sudo mount -a
