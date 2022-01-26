---
categories:
- var
date: "2006-10-13T00:00:00Z"
tags: []
title: boost::format
---

<blockquote style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;" class="gmail_quote"><pre>std::cout << format("%|1$1| %|2$3|") % "Hello" % 3 << std::endl; 
</pre><div>官网的这个例子，其中
竖线 | 用来格式化目标串，且必须匹配。可以把两个竖线及其之间的内容看作一个s，即%|1$1| == %s 
</div>美元 $ 用来填充目标串，后面所跟的数值表示要把目标串填充至多少位。看几个例子就知道了：
<blockquote style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;" class="gmail_quote"> <pre>std::cout << format("%|1$1| %|2$3|") % "Hello" % 3 << std::endl;</pre> Hello<span style="background-color: rgb(204, 255, 255);">&nbsp;</span><span style="background-color: rgb(102, 255, 255);"> </span>3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <--- 中间两个空格(3 - length("3"))
<blockquote style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;" class="gmail_quote">    <pre>std::cout << format("%|1$8| %|2$2|") % "Hello" % 3 << std::endl;</pre>  <span style="background-color: rgb(255, 204, 204);"><span style="background-color: rgb(204, 255, 255);">&nbsp;</span><span style="background-color: rgb(102, 255, 255);">&nbsp;</span><span style="background-color: rgb(51, 204, 255);">  </span></span>Hello<span style="background-color: rgb(51, 102, 255);"> </span>3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <--- 开头三个空格(8 - length("Hello"))，中间一个空格(2 - length("3"))
 
