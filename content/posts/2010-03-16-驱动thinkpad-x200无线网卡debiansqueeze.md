---
categories:
- var
date: "2010-03-16T00:00:00Z"
tags:
- hack
title: 驱动 ThinkPad X200 无线网卡 Debian/squeeze
---

RT @<http://tinyurl.com/yewgdmh>

好像 X200 原来的无线网卡是 intel 的，不过现在换成 Realtek 了。

    03:00.0 Network controller: Realtek Semiconductor Co., Ltd. Device 8172 (rev 10)

下载 RTL8192SE For Linux 的[驱动][1]

    1$ sudo apt-get install linux-headers-`uname -r`
    2$ tar zxf rtl8192se_linux_2.6.0015.0127.2010.tar.gz
    3$ cd rtl8192se_linux_2.6.0015.0127.2010
    4$ make
    5$ (make install 会报错。不用担心，通过下面的方法手动安装)
    6$ sudo cp HAL/rtl8192/r8192se_pci.ko /lib/modules/`uname -r`/kernel/net/wireless/
    7$ sudo cp -r firmware/RTL8192SE /lib/firmware/
    8$ sudo depmod -a
    9$ sudo modprobe r8192se_pci

[1]: http://tinyurl.com/yefqho5
