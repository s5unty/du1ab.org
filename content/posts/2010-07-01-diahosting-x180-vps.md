---
categories:
- var
date: "2010-07-01T00:00:00Z"
tags:
- vps
title: DiaHosting X180 型号的 VPS
---

内存 180M，选装了 debian，外加 wordpress、sshd、mysql、nginx。500
并发数持续测试 5 分钟

    137% webbench -c 500 -t 300 http://127.0.0.1/

    Webbench  - Simple Web Benchmark 1.5
    Copyright (c) Radim Kolar 1997-2004, GPL  Open Source Software.

    Benchmarking: GET http://127.0.0.1/
    500 clients, running 300 sec.

    Speed=1446 pages/min, 522264  bytes/sec.
    Requests: 7232 susceed, 0 failed.

    138% free -m
                 total       used       free     shared    buffers     cached
    Mem:           180        130         50          0          5         69
    -/+ buffers/cache:         55        125
    Swap:          191          0        191
