---
date: "2016-08-28T00:00:00Z"
tags: [b/配置/3, b/文件系统/2]
title: 一个解决 NFS 挂载点无法 umount 的方法
---

- 背景
关闭了一台提供 NFS 服务器，使用了这台服务器挂载点的机器都有异常。

- 现象
执行 `umount`、`umount -f`、`umount -l`、`umount -f -l` 都无法卸载挂载点。

- [调查][1]

  > If the NFS server disappeared and you can't get it back online, one trick that
  > I use is to add an alias to the interface with the IP of the NFS server 

- 方法
  1. 新增一个虚拟 IP，地址为原来的 NFS 服务器地址
  2. 装配一个 NFS 服务，导出原来的 NFS 挂载点地址
  3. 执行 umount
  4. 删除之前的 NFS 服务和虚拟 IP

[1]: http://stackoverflow.com/questions/40317/force-unmount-of-nfs-mounted-directory