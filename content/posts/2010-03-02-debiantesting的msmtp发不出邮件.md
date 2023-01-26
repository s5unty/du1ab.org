---
date: "2010-03-02T00:00:00Z"
tags: b/邮件/4/b
title: debian/testing 的 msmtp 发不出邮件
---

RT @<http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=564661#129>

> Premysl Hruby <<a href="mailto:dfenze@gmail.com">dfenze@gmail.com</a>> writes:
>
> > gsasl: initialization failure: Low-level crypto error in SASL library
>
> I believe this means libgsasl was built against libgcrypt in unstable,
> but you are running libgsasl with libgcrypt from testing.  The version
> comparison fails in libgsasl (unstable 1.4.5 > testing 1.4.4) so
> libgsasl refuses to work.

发不出邮件，提示我 "SASL 库中出现低级加密错误"，检查发现和 msmtp 采用的加密库
GNU SASL 有关执行 gsasl --client-mechanism 可检测加密库是否正确，

    $ gsasl --client-mechanisms
    gsasl: 初始化失败：SASL 库中出现低级加密错误
    $ wget <http://ftp.kr.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.4.5-2_i386.deb>
    $ dpkg -i libgcrypt11_1.4.5-2_i386.deb
    $ gsasl --client-mechanisms

这个客户端支持以下机制：

ANONYMOUS EXTERNAL LOGIN PLAIN SECURID NTLM DIGEST-MD5 CRAM-MD5
SCRAM-SHA-1 GSSAPI
