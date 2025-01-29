---
date: "2011-01-02T00:00:00Z"
tags: life/pc
title: VirtualBox 安装 Mac OS X
---

在 PC 物理环境中安装 Mac OS X 不能。笔记本 x200 安装原版 SnowLeopard 10.6.0 成
功，但进入桌面后键盘失效。改用黑苹果安装盘 —— 东皇 10.6.3-v2.2，中途就报错，只
能重启。

下载 VirtualBox-4.0.0、EmpireEFI-1063.zip、snowleopard_10a432_userdvd.dmg、
MacOSXUpdCombo10.6.5.dmg

启动 VirtualBox 取消[启用 EFI]选项，开启[Enable absolute pointing device]选项，
网络使用[Bridged Adapter]，创建虚拟硬盘，加载 EmpireEFI-1063.zip 解压得到的两个
引导 ISO 中的任意一个，加载刚刚创建的虚拟硬盘，启动虚拟机，完成安装。

下载 10.6.5 升级包 MacOSXUpdCombo10.6.5.dmg，scp 复制到虚拟机安装，比虚拟机里在
线更新速度快。

VirtualBox 默认不能使用 1680x1050 的分辨率，执行命令添加自定义分辨率:

    VBoxManage setextradata "OSX" "CustomVideoMode1" "1680x1050x32"

启动虚拟机后在引导界面，输入

    "Graphics Mode"="1680x1050x32"

安装完成后创建备份

* 每次都需要 ISO 引导才能进入 Mac OS X 系统，不知道怎么自动引导
* 每次都需要手动输入改变分辨率的指令，com.app.Boot.plist 修改无果
