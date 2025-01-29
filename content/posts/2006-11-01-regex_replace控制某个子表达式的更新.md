---
date: "2006-11-01T00:00:00Z"
tags: [txt/re/正则, dev/cpp]
title: regex_replace控制某个子表达式的更新
---

```cpp
str = boost::regex_replace(str, reg, "(?1become1)$2(?3become3)$4", boost::format_all );
```

其中第一个子表达式更新为become1，第三个子表达式更新为become3。
