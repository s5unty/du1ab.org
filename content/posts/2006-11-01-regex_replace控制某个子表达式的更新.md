---
categories:
- var
date: "2006-11-01T00:00:00Z"
tags: []
title: regex_replace控制某个子表达式的更新 sA==
---

str = boost::regex_replace(str, reg, "<span style="color: rgb(255, 102, 102);">(?1become1)</span>$2<span style="color: rgb(255, 102, 102);">(?3become3)</span>$4", <span style="color: rgb(255, 102, 102);">boost::format_all </span>);<br clear="all">
其中第一个子表达式更新为become1，第三个子表达式更新为become3。
