---
categories:
- var
date: "2006-09-11T00:00:00Z"
tags: []
title: Glib::Cond::timed_wait
---

申明一个Glib::TimeVal timeout变量
然后
while(yourcond) {
&nbsp; timeout.assign_current_time();
&nbsp; timeout.add_seconds(2);&nbsp; // 2 seconds
&nbsp; ...timed_wait(*obj, timeout);
}
