---
date: "2007-09-01T00:00:00Z"
tags: ide/se
title: slickedit 使用正则表达式替换字符
---

考虑把
```
m_KeyInsideMap[KEY_SHIFT] = "Shift";
```
替换成
```
$key_inside_map{KEY_SHIFT} = "Shift";
```

用 SlickEdit 替换对话框中的 Unix 正则表达式，像这样替换：
```
Search for:
m_KeyInsideMap\[(.+)\]

Replace with: 
 $key_inside_map{\1}

```
