---
date: "2006-12-12T00:00:00Z"
tags: b/操作系统/2/c
title: isolinux制作debian启动盘
---

from http://gnawux.googlepages.com/syslinux ，王旭

**关键词**: boot loader, initrd, syslinux, isolinux, damn small linux, debian installer, bootable usb flash disk  

## 说明 & 免责声明:

- U 盘的可引导性同时依赖于 U 盘本身和计算机主板，较早主板一律不支持
- 作者不对读者因为参照本文所引起的一切后果负责

## 一、引导程序概述

任何一个操作系统在任何一个硬件平台上的运行都需要一个引导的过程，即，初始化软件环境、把内核从存储介质放到内存当中去，并开始运行。当然对于某些简单软硬件系统，这个过程可能及其简单，而对于 PC 就要略微复杂一些了。

PC 的引导程序上承 BIOS，下接内核的初始化代码，虽然开一次机只运行一次后就不留痕迹了，不过还是相当重要的。所有的引导程序都在做类似的事情: 

- 驻留在存贮介质的特殊位置可以被 BIOS 启动，或是自己是某一系统的可执行文件，可以被用户显式或隐式在该系统（宿主系统）内启动；
- 了解要被启动的必要启动文件的位置，包括系统内核、ramdisk 等，并把它们读取出来、装载到内存之中；
- 构造环境、运行操作系统的内核，自己则就此退出历史舞台。

历史上，用于 Linux 的最著名的引导程序莫过于 LILO 和 Grub 了，作为通用的引导程序，二者用途广泛，但对于一些特殊的场合，譬如引导程序可利用的空间比较有限的可移动存储介质 (通俗地说，包括光盘、软盘、u 盘等)，它们有些过于厚重了，这就引出了我们今天的主角 --- SYSLINUX/ISOLINUX，现在，你只要知道他们是引导程序就足够了，接下来，我们还要插入一些废话。 

## 二、initrd

initrd = init ramdisk, 顾名思义，就是在启动时使用的一个内存虚拟磁盘，它是系统广泛的硬件支持性的必需品。

我们知道，Linux 的驱动程序是内核的一部分，它们提供了硬件向上层的抽象接口，Linux 内核的核心子系统 --- 虚拟文件系统部分的工作强烈依赖于底层硬件驱动程序的支持，在启动过程当中，当某些必备的驱动程序无法使用的时候，比如 EXT2 文件系统、IDE 硬盘适配器等无法工作的时候，系统启动将就此中止，发生所谓的\`\`Kernel Panic''，这也是初学者编译内核最常遇到的困难。

然而，我们当然不能将所有的驱动都编译到内核当中去，因为

- 我们不能无限制地加大内核的尺寸，这对于系统资源，尤其是引导过程中非常有限的可用存储资源是难以承受的
- 我们可以把很多驱动程序编译成模块，随用随加载
- 极少数情况，某些模块是相互冲突的，比如 2.4 内核的某些版本之中，reiserfs 和 ext3 两种驱动不能同时被编译到内核当中。

所以，我们只能在内核中放入必要的驱动程序，其余的不那么需要的部分编译成模块放到 /lib/modules/\`uname -r\`/ 之中，在需要的时候会被加载。

但是，对于具有通用性的内核，是很难论断出哪几种驱动程序才是真正必须的，究竟是 Intel 的 IDE 磁盘控制器还是 AMD/nVidia 的，抑或是 VIA 的，乃至光纤通道SCSI 磁盘……是阿，这真是个很困扰人的问题，没有一个驱动可以在占用绝对少的空间的前提下应付所有的设备，于是，我们退而求其次，寻求一个中间介质 --- ramdisk

在内核启动前，引导程序首先在内存之中构建一个 ramdisk，成为一个基本文件系统，然后 Linux 内核以此为自己的根文件系统启动，这样的好处是可以不必理会磁盘驱动的问题，只要能驱动 ramdisk 就可以了。

用 ramdisk 启动之后，在 ramdisk 的启动脚本 (一般叫 /linuxrc) 之中，针对硬件尝试 ramdisk 里面的 /lib/modules/\`uname -r\`/，加载恰当的驱动，这时系统已经具备了切换到硬盘或其他介质上的文件系统的条件了。

机不可失，这时，我们首先加载硬盘或光盘、u 盘等启动介质，然后设该介质为根分区，并运行其 init 进程为 1 进程，之后，在 init 脚本中，释放掉 initrd 的空间，这就是借助 initrd 的引导过程。在这个过程之中 引导程序帮我们多做了一件事 --- 构建 ramdisk, 把 initrd 放入内存。

## 三、用 SYSLINUX/ISOLINUX 引导软盘和光盘

上文已经说过了，SYSLINUX/ISOLINUX 是专门用来引导可移动介质的轻量级引导程序，因为这样的介质通常不会固定只针对一种硬件，initrd 当然是 SYSLINUX/ISOLINUX 必须支持的功能了。这两种引导程序其实是一样的，没有多大区别，只是放在不同的设备的引导区罢了。 

### 3.1 配置 SYSLINUX/ISOLINUX

对于这两种引导程序，都会有一段引导代码，写入引导代码的时候，还同时需要一个配置文件: syslinux.cfg/isolinux.cfg，同样，这两个文件也是一样的，唯一的区别在于文件名，其各个字段的写法如下: 

    DISPLAY xxx.txt  
这指定了一个文件名，会在启动的时候显示的内容，该文件甚至可以包含一个 RLE 编码的图形文件，也就是大家在安装光盘启动时看到的那个；不过这个字段不甚重要，我们就略过了。 

    DEFAULT linux  
指定 label 是 linux 的启动选项为缺省，当然也可以是别的。

    LABEL linux
        kernel vmlinuz
        append initrd=initrd26.gz ramdisk\_size=1000000 vga=791

这就是一个启动描述，前面的 label 大家都认识了，之后分别是指定 kernel 和内核参数，其中重要的参数就是 initrd= 指定 initrd 的文件和 ramdisk\_size= 指定 initrd 的尺寸上限。其余的内核参数还可能有很多，不过这里的参数我们一般都可以抄过来。这样的启动选项描述是可以有若干个的。

    PROMPT=1  
    
这是说，向用户提示输入选择，直接回车就是缺省选项了

    TIMEOUT=0  

没有时间限制，当然也可以指定一定时间之后自动进入缺省选项。

好了，就这么多，如果你会用 LILO 的话，用这个一定得心应手，说实话 grub 也差不了太多。  

### 3.2 安装 SYSLINUX/ISOLINUX

配置文件写完了，现在进入实质阶段，这里，两种引导程序还是略有差别的，首先介绍SYSLINUX:

首先格式化引导介质为 FAT16 格式 (软盘似乎应该是 FAT12)，我们的例子里面是 U 盘，  

    mkdosfs -F16 -I /dev/sda  
    
我们是操作整个 U 盘，而不是里面的唯一分区，这种情况不是很多见，只是手上的 U 盘比较特殊，大部分情况下，我们也可以  

    mkdosfs -F16 /dev/sda1  

然后挂在该 U 盘，放入我们的 syslinux.cfg 以及 kernel 和 initrd.gz，还有其他启动所需要的东东，之后 umount 该 U 盘。

    **\* 执行下面操作之前，必须 umount U 盘！\***  

然后写引导区:  

    syslinux /dev/sda (或 syslinux /dev/sda1，如果是格式化的 /dev/sda1 的话)  
    
至此就完成了。

对于光盘，同样不复杂，我们用 ISOLINUX:

在准备制作 ISO 的目录里添加一个子目录，比如 boot/isolinux/ ，然后放入 isolinux.cfg 和一个对所有光盘都一样的 isolinux 提供的引导介质 isolinux.bin，当然还要放入相应的 kernel, initrd 等等，然后，制作 iso 的时候要使用 -b 参数:  

    mkisofs -o output.iso \\  
        -b boot/isolinux/isolinux.bin -c boot/isolinux/boot.cat \\  
        -no-emul-boot -boot-load-size 4 -boot-info-table \\  
        for-iso-dir/  

最后的参数就是指定的光盘的目录了，-c 参数的那个文件是自动生成的，不用太担心，其余参数都是固定的。事实上，也常常有人用 isolinux/ 而不是 boot/isolinux/ ，这都是约定俗成的，你完全可以用自己的。这里的路径都是相对于光盘的根的，而和制作光盘时的工作目录没有关系。

至此，你也会用 SYSLINUX/ISOLINUX 了。 :)  

## 四、实战 --- damn small linux + debian installer, 2 in 1 usb disk

1. 下载 di 的 hd-image 里的 kernel image 和 initrd，放入 U 盘，同时把 businesscard iso 也放进去，从 iso 里找到 isolinux.cfg，记下里面的启设置
2. 下载 dsl，把 KNOPPIX 目录搬到我们的 U 盘里，把 boot/isolinux/ 里面的 kernel image 和 initrd 也放入 U 盘的根目录，这时，U 盘根目录里同时有二者的启动文件了，也记住 dsl 里面的 isolinux.cfg 的启动选项。
3. 以其中一个的 isolinux.cfg 为基础，加入另一个的启动参数，注意 label 命名不要冲突了就可以了。
4. umount U盘，然后对 U 盘运行 syslinux，写引导区，大功告成。

如前面帖子说过，dsl 的 initrd 之中，只搜索 /dev/sda\[1-9\] 而不搜索/dev/sda，所以，如果如果像我们一样被迫用 /dev/sda 的话，就不得不修改一下 dsl 的 initrd 里面的 linuxrc 了，除此之外，没有什么其它值得大书特书的了。

Enjoy it!

## 参考  

我还写过一篇《Damn Small Linux + Debian Netinstall, 2 in 1》，用来制作二合一光盘，可以从  http://gnawux.blogchina.com/4006413.html  找到。
