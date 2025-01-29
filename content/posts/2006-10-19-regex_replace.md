---
date: "2006-10-19T00:00:00Z"
tags: [txt/re/正则]
title: regex_replace
---

```cpp
#include <iostream>
#include <string>
#include <boost/regex.hpp>

int main() {
    boost::regex reg("(Colo)(u)(r)", regbase::extended | regbase::icase);

    std::string s="Colour, colours, color, colourize";
    s=boost::regex_replace(s,reg,"$1$3");
    std::cout << s;
}
```

```
#g++ test.cpp -lboost_regex
#./a.out
Color, colors, color, colorize
```
