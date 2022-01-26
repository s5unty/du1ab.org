---
categories:
- usr
date: "2010-01-10T00:00:00Z"
tags: []
title: 'java.net.SocketException: Network is unreachable'
---

RT @<http://tinyurl.com/ydp8tag>

    1. edit /etc/sysctl.d/bindv6only.conf
    2. change value net.ipv6.bindv6only=1 into 0
    3. invoke-rc.d procps restartp. 

RT @<http://tinyurl.com/yccgu9m>

Adding the extra flag "-Djava.net.preferIPv4Stack=true" fixed the issue.
Netflow now starts correctly.
