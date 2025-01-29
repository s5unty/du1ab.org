---
date: "2009-01-11T00:00:00Z"
tags: mutt/邮件
title: 解决新版本 msmtp 在使用 gmail 服务器发送邮件时遇到的一个问题
---

1.4.11 之后的 msmtp 程序在使用 TLS 方面要求，要么提供 **tls_trust_file**，要么禁
止 **tls_certcheck**

如果在使用 msmtp 发送邮件时遇到 TLS 的问题，最简单的解决办法是在 msmtprc 文件中
添加一行：
`@tls_certcheck off@`
