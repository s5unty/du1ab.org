---
categories:
- var
date: "2007-02-01T00:00:00Z"
tags:
- shell
title: The friendly interactive shell
---

今天发现一个不错的shell: fish。 \
官方网站：<http://fishshell.org/> \
相关介绍：<http://lwn.net/Articles/136232/>

我一直以来使用的都是Linux的标配shell: bash，今天促使我另寻新欢的原因是，每当 \
我在bash中用[TAB]键的自动提示功能时，总是有这样一个让我不爽的地方：

假设/sun/目录有多个子目录，我当前在/根目录。此时我输入cd /su，然后敲一下TAB，bash很配合的把命令补全为cd /sun/。 \
然而令我不爽的正是此时，当我再一次敲TAB时，理应显示出/sun/目录下的所有子目录，然而实际情况却不是： \
我必须要再一次动用我的左手无名指，敲击一下TAB，然后我才能看到子目录。 \
不知道其他人的bash有没有我这样的问题。

    apt-get install fish

1. PS1(prompt)的区别

    bash:

        PS1='\w> '

    fish:

        function fish_prom -d "Write out the prompt"
         printf '%s%s%s> ' (set_color yellow) (prompt_pwd) (set_color normal)
        end

2. 取别名的区别

    bash：

        alias s78="ssh somebody@192.168.10.78"

    fish: 

        function s78
         ssh somebody@192.168.10.78
        end

3. ` 的区别

    bash: 

        ls -l `which fish`

    fish:

        ls -l (which fish)
