---
date: "2009-10-09T00:00:00Z"
tags: www/tor
title: 如何在 Ubuntu 下配置 TOR Bridges
---

RT @<http://vangie.bothlog.com/2009/09/27/%E5%9C%A8ubuntu%E4%B8%8Btor%E9%85%8D%E7%BD%AEbridges%E7%A9%BF%E5%A2%99/>

Step1: 获取网桥地址

用你的 gmail 帐号发送主题和内容为 "get bridges" 的邮件至
[mailto:bridges@torproject.org](bridges@torproject.org)

Step2: 配置Tor网桥

首先，备份原Tor配置文件torrc至备份目录:

    sudo cp -p /etc/tor/torrc your-backup-directory

然后在torrc配置文件末尾添加"UseBridges 1"开关选项(默认是0, 即关闭状态)，

    UseBridges 1
    UpdateBridgesFromAuthority 1

最后，将 [mailto:bridges@torproject.org](bridges@torproject.org) 回复邮件中的
bridge 列表附加至 torrc 配置文件末尾，请按回复邮件中的 bridge 的原有格式添加，
即:

    bridge ip:port fingerprint

上述两篇博客中谈到的邮件中有 fingerprint 字段，我收到的邮件中没有，但是测试后发
现同样有效

Step3: 重启 Tor 和 Privoxy

    sudo /etc/init.d/tor restart
    sudo /etc/init.d/privoxy restart
