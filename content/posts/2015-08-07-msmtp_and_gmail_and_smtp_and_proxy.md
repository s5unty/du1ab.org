---
date: "2015-08-07T00:00:00Z"
tags: [b/邮件/1/l, b/谷歌/12]
title: msmtp and gmail and smtp and proxy
---

我日他个佬佬，Gmail 你也封啊，好不了了哦。

在网页上，咱有科学上网，自然不会有问题。
问题在用客户端时，只能收(pop3)不能发(smtp)。

最先怀疑是 msmtp 的配置问题，以为 Gmail 变更了[参数][1]。
期间发现是 smtp.gmail.com 的 IP 被枪了，用 telnet 测试。

- 未被枪

    ```bash
    % telnet smtp.gmail.com 587
    Trying 74.125.204.108...
    Connected to gmail-smtp-msa.l.google.com.
    Escape character is '^]'.
    220 smtp.gmail.com ESMTP vx1sm6944922pac.43 - gsmtp
    quit
    221 2.0.0 closing connection vx1sm6944922pac.43 - gsmtp
    Connection closed by foreign host.
    ```

- 已被枪

    ```bash
    % telnet smtp.gmail.com 587
    Trying 74.125.23.109...
    Trying 74.125.23.108...
    Trying 2404:6800:4008:c05::6d...
    telnet: Unable to connect to remote host: Network is unreachable
    ```

科学上网加，就想想怎么用代理翻吧。
Google 到[这篇][2]，试了果然可以。
首先在外服上开好代理，然后在桌面使用外服的代理。

```bash
[@du1abadd.org]% sudo ssh -L 0:9587:smtp.gmail.com:587 127.0.0.1
```

在桌面上测试一下(注意新的端口号)，已经过去了。

```bash
% telnet du1abadd.org 9587
Trying 106.187.96.222...
Connected to du1abadd.org.
Escape character is '^]'.
220 smtp.gmail.com ESMTP j5sm7026435pdi.7 - gsmtp
quit
221 2.0.0 closing connection j5sm7026435pdi.7 - gsmtp
Connection closed by foreign host.
```

- 原先的 msmtprc

    ```
    account gmail
    host smtp.gmail.com
    port 587
    from your@gmail.com
    user your@gmail.com
    password your_password
    auth on
    tls on
    tls_certcheck off
    ```

- 改用代理后的 msmtprc

    ```
    account gmail
    host du1abadd.org
    port 9587
    from your@gmail.com
    user your@gmail.com
    password your_password
    auth on
    tls on
    tls_certcheck off
    ```

[1]: https://support.google.com/mail/troubleshooter/1668960?hl=en&rd=1#ts=1665119,1665162
[2]: https://www.debian-administration.org/article/487/SMTP_via_a_SSH_tunnel