---
date: "2007-01-22T00:00:00Z"
tags: [b/字体/4, b/编辑器/1/g]
title: slickedit字体设定
---

还是换回了 SlickEdit10，11 的 crash 问题没法解决。

修改 /opt/slickedit/unicode/fontsets.ini，添加以下内容：

    [simsun]
    ptSize = 14
    isFixed = 0
    isBold = 0
    isItalic = 0
    font = -adobe-courier-medium-r-normal--14-100-100-100-m-90-iso8859-1:0x0000-0x00ff
    font = -*-simsun-medium-r-normal--14-0-0-0-p-0-iso10646-1:0x2800-0x28ff
    font = -*-simsun-medium-r-normal--14-0-0-0-p-0-iso10646-1:0x3000-0x33ff:0x4e00-0xffff
    font = -*-simsun-medium-r-normal--14-0-0-0-p-0-iso10646-1 

设定 SlickEdit 的 Unicode Source Windows 字体为：

    VSE Unicode-simsun
