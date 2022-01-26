---
categories:
- var
date: "2018-09-08T00:00:00Z"
tags:
- ms
- grub
- efi
- ubuntu
- surface
title: Surface Go 和 Ubuntu
---

![][img-ubuntu]

Surface 默认是 Win10 系统，一直想换成 Linux 系统，从昨天搞到今天，满意了。
有 [推上][ref-twitter] 成功的先例，以及 [讨论版][ref-reddit] 上的详细介绍，动手之前，没有太担心。
然而，还是有意外发生，多亏了 [这篇帖子][ref-csdn]，差点就要拿去送修了。

墙裂忠告，在动手前，确保你的 USB 安装盘，能够被正常识别、加载、启动。
在 Linux 下的制作方法，在 [这里][ref-github]，亲测有效。
**不要用 dd 命令，不要用 dd 命令，不要用 dd 命令，，，制作安装盘。**

1. 充电
   保持 20% 以上，够用 1 小时就行
2. 插入 USB 安装盘
3. 关机
   强行关机？长按电源键 10 秒左右
4. 进入「BIOS」
   如何进入？关机状态下，按住「音量上」键，再按住「电源键」，看到微软的 Logo 后，松开两个键即可。
5. 关闭「Secure Boot」
   ![实物截图](http://du1ab.one/images/2018/secure.png)
6. 调整引导顺序
   ![实物截图](http://du1ab.one/images/2018/order.png)
7. 退出「BIOS」
8. 等待「Grub」
9. 正常安装即可

安装盘制作完，剩下的就容易了，和普通电脑的安装，没有什么差别，除了，
**不要用 xfs 格式，不要用 xfs 格式，不要用 xfs 格式，，，作为根分区。**
如果你和我一样，非要用 xfs 格式。请用 ext4 格式单独分 /boot，亲测有效。

成功安装以后，Wifi 不能工作，按 [讨论版][ref-reddit] 的说明方法顺利解决，
关于平板模式的虚拟键盘，可以 `apt install onboard`，还有些小问题，就不啰嗦了。

[ref-twitter]: https://twitter.com/bketelsen/status/1026643011126603776
[ref-reddit]: https://www.reddit.com/r/SurfaceLinux/comments/94hjxv/surface_go_first_impressions/
[ref-csdn]: https://blog.csdn.net/x13945/article/details/51219070
[ref-github]: https://github.com/ndeineko/grub2-bios-uefi-usb
[img-ubuntu]: http://du1ab.one/images/2018/ss_20180908_194701.png
