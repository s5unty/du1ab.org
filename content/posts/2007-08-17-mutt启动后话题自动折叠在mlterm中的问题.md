---
date: "2007-08-17T00:00:00Z"
tags: mutt/邮件
title: mutt启动后话题自动折叠在mlterm中的问题
---

首先是设置让mutt启动后自动折叠话题，修改配置文件，确认以下两行存在：

    set collapse_unread=no                  # 允许折叠未读邮件所在的话题
    folder-hook . "push <collapse-all>"     # 启动后立即使用折叠方式显示邮件

如此设置后，在终端运行mutt即可看到效果。

另外遇到一个比较奇怪的问题，使用命令：

    1$ mlterm -T Mutt -e mutt

启动后的mutt并没有自动折叠，尝试使用：

    2$ mlterm -T Mutt -#="exec mutt\n"

即可解决该问题。`-#`参数是传递给刚刚打开的mlterm的字符串。
