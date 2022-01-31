---
categories:
- var
date: "2006-12-22T00:00:00Z"
tags: []
title: kubuntu下firefox标签里粗体英文显示的问题 moTpl67popg=
---

在ubuntu下安装kubuntu-desktop套件，然后在登录界面选择kde，进入后默认语言是英语，需要的话可以先安装中文语言包

```
$ sudo apt-get install language-pack-kde-zh language-pack-kde-zh-base language-pack-zh language-pack-zh-base language-support-zh
```

当使用Firefox(2.0 )开gmail时，发现标签栏里gmail这几个英文字非常丑陋──凡是标签栏里的英文都巨丑……

首先必须安装相应的字体，因为我之前已经在gnome环境中对字体作过相关调整，所以这里不在复述。
但如果你之前没有调整过，可以看[这篇](http://s5unty.blogspot.com/2006/12/ubuntusimsun_12.html)。注意调整后要重启X──Ctrl+Alt+Backspace

1. 在KDE菜单.系统设定.外观.GTK Styles and Fonts页面，修改"Gtk Fonts"为"Use another font:"，并选择"Tahoma"，
2. 在KDE菜单.系统设定.外观.字体页面，钩选"圆整字体边角"
3. "应用"，然后重启X即可
