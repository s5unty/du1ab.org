---
date: "2006-10-13T00:00:00Z"
tags: dev/cpp
title: boost::format
---

```
std::cout << format("%|1$1| %|2$3|") % "Hello" % 3 << std::endl; 
```

官网的这个例子，其中竖线 `|` 用来格式化目标串，且必须匹配。
可以把两个竖线及其之间的内容看作一个s，即 `%|1$1|` == `%s`
美元 $ 用来填充目标串，后面所跟的数值表示要把目标串填充至多少位。

看几个例子就知道了：
```
std::cout << format("%|1$1| %|2$3|") % "Hello" % 3 << std::endl;
Hello  3                <--- 中间两个空格(3 - length("3"))

std::cout << format("%|1$8| %|2$2|") % "Hello" % 3 << std::endl;
Hello 3                 <--- 开头三个空格(8 - length("Hello"))，中间一个空格(2 - length("3"))
```
