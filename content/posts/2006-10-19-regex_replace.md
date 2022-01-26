---
categories:
- var
date: "2006-10-19T00:00:00Z"
tags: []
title: regex_replace
---

p. <font color="#800000"><span style="color: rgb(0, 0, 0);">   #include <iostream></span><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">   #include <string></span><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">   #include <boost/regex.hpp></span><br style="color: rgb(0, 0, 0);"><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">    int main() {</span><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);"> &nbsp;&nbsp;&nbsp;    boost::regex reg("(Colo)(u)(r)",</span><span style="color: rgb(0, 0, 0);"> regbase::extended | regbase::icase);</span><br style="color: rgb(0, 0, 0);"><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">   &nbsp;&nbsp;&nbsp;    std::string s="Colour, colours, color, colourize";</span><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);"> &nbsp;&nbsp;&nbsp;    s=boost::regex_replace(s,reg,"$1$3");</span><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);"> &nbsp;&nbsp;&nbsp;    std::cout << s;</span><br style="color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0);">   }</span></font>


#g++ test.cpp -lboost_regex
#./a.out
Color, colors, color, colorize
