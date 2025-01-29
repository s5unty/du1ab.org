---
date: "2007-03-07T00:00:00Z"
tags: os/boot
title: 往d-i的cdebconf中添加自定义界面
---

* 创建实现cdebconf的plugin接口的程序<http://people.openrays.org/~s5unty/#plugin-hello.so>:

* 创建plugin-hello.so的udeb包，并集成到ISO中

* 输入"install DEBIAN_FRONTEND=newt"信息后，回车启动安装程序

    ![](https://blog.du1ab.org/2007/boot.png)

* 启动完毕后的看到的newt界面

    ![](https://blog.du1ab.org/2007/booted.png)

* 使用Ctrl-Alt-2切换到qemu的命令行窗口，输入"sendkey ctrl-alt-f2"

    ![](https://blog.du1ab.org/2007/sendkey.png)

* 使用Ctrl-Alt-1切换到d-i的安装程序中，拥有了busybox下的提示符

    ![](https://blog.du1ab.org/2007/activate.png)
    ![](https://blog.du1ab.org/2007/busybox.png)

* nano编辑/hello.templates和/hello.config，设置/hello.config的可执行权限

    ![](https://blog.du1ab.org/2007/hello_config.png)
    ![](https://blog.du1ab.org/2007/hello_templates.png)

* nano编辑/sbin/debian-installer文件，export MENU=/hello.config

    ![](https://blog.du1ab.org/2007/debian-installer.png)

* 执行debconf-loadtemplates d-i /hello.templates

* 执行export DEBIAN_FRONTEND=gtk

* 执行debian-installer

    ![](https://blog.du1ab.org/2007/reday_go.png)

* 运行效果

    ![](https://blog.du1ab.org/2007/inside.png)
