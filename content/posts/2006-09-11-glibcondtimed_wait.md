---
date: "2006-09-11T00:00:00Z"
tags: dev/gtk
title: Glib::Cond::timed_wait
---

申明一个Glib::TimeVal timeout变量，然后

```cpp
while (yourcond) {
    timeout.assign_current_time();
    timeout.add_seconds(2);     // 2 seconds
    ...timed_wait(*obj, timeout);
}
```
