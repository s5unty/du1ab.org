---
date: "2006-12-10T00:00:00Z"
tags: os/ubuntu
title: 找到一个ubuntu edgy源
---

cn99的速度虽然快，但是从dapper升级的时候发现包不完整，而且debian的官方镜象也用不了

    deb http://ubuntu.cnsite.org/ubuntu/ edgy main restricted universe multiverse
    deb http://ubuntu.cnsite.org/ubuntu/ edgy-updates main restricted universe multiverse
    deb http://ubuntu.cnsite.org/ubuntu/ edgy-backports main restricted universe multiverse
    deb http://ubuntu.cnsite.org/ubuntu/ edgy-security main restricted universe multiverse
    deb http://ubuntu.cnsite.org/ubuntu/ edgy-proposed main multiverse restricted universe
    deb http://ubuntu.cnsite.org/ubuntu-cn/ edgy main multiverse restricted universe

    deb-src http://ubuntu.cnsite.org/ubuntu/ edgy main restricted universe multiverse
    deb-src http://ubuntu.cnsite.org/ubuntu/ edgy-updates main restricted universe multiverse
    deb-src http://ubuntu.cnsite.org/ubuntu/ edgy-backports main restricted universe multiverse
    deb-src http://ubuntu.cnsite.org/ubuntu/ edgy-security main restricted universe multiverse
    deb-src http://ubuntu.cnsite.org/ubuntu/ edgy-proposed main restricted universe multiverse
