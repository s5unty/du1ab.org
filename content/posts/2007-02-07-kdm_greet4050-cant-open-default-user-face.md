---
categories:
- var
date: "2007-02-07T00:00:00Z"
tags: []
title: 'kdm_greet[4050]: Can''t open default user face'
---

在kdm中输入用户名口令后回车，竟然没有登进系统，却再一次回到登录界面。 \
Ctrl+Alt+F2切换到其它终端查看/var/log/syslog，发现以下错误信息：

    kdm_greet[4050]: Internal error: memory corruption detected
    kdm_greet[4050]: Can't open default user face

~/.xsession-errors中存在以下错误信息：

    Xsession: X session started for sun at Fri Se
    
    1 08:44:38 AST 2006
    open: permission denied

图好玩，我用w3m上google，找到了[解决方法][1]：

执行 `chmod ug+rwx,o+rwt /tmp` 即可。

w3m用"Ctrl+Backspace"实现网页的后退。^^

[1]: http://www.linuxquestions.org/questions/showthread.php?p=2405364#post2405364
