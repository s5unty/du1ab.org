---
categories:
- var
date: "2007-01-07T00:00:00Z"
tags: []
title: 如何快速测试procmailrc
---

在 fetchmail 收到邮件后，可以做到自动让 procmail 执行分拣工作。但是对已经接收到本地的邮件，怎样才能手动让 procmail 执行分拣工作呢？

假设我要对已经收到的邮件/sun/mails/company 重新作一次分拣，我可以执行以下命令（请注意备份）：

    mv /sun/mails/company /sun/mails/seed
    formail -s procmail < /sun/mails/seed

注意是 formail，而不是 fetchmail ^^

参考 http://info.ccone.at/INFO/Mail-Archives/procmail/Jun-2005/msg00053.html
