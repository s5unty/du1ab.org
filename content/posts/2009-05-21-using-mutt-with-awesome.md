---
categories:
- usr
date: "2009-05-21T00:00:00Z"
tags:
- mutt
- awesome
- urxvt
- hack
title: Using Mutt with Awesome
---

RT @<http://awesome.naquadah.org/wiki/index.php?title=Irssi_tips>

假设你用 awesome，也许你也用 urxvt，可能你还用 mutt，那么下面的技巧可能对你有用。

打开一个终端运行 mutt，并把这个终端放到某个 tag 里(假设这个 tag.name 是 4)，然
后离开这个 tag4，确认在 mutt 配置的 timeout 时间内(默认10分钟)不进入 tag4。当你
看到 tag4 的标签背景色变红时，这就说明你有新邮件了。

- awesome 配置项 bg_urgent (默认存在)

      bg_urgent = #ff0000

- urxvt 配置项 urgentOnBell

      ilmf.s5unty% cat ~/.Xresources | grep Bell
      URxvt.urgentOnBell:  True
 
- mutt 配置项 beep_new, check_new, timeout

      ilmf.s5unty% cat ~/.mutt/muttrc | grep -E "new|timeout"
      set beep_new=yes
      set check_new=yes #默认存在
      set timeout=600 #默认存在

上述配置项有些是默认存在的，确保它们没有被删除就好。提醒: 

修改过 ~/.Xresources 之后记得运行 xrdb ~/.Xresources，并且要重新打开一个终端运行 mutt 测试。
