---
categories:
- var
date: "2007-03-05T00:00:00Z"
tags:
- vim
title: mlterm && vim && black && bold
---

[这里](http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/)有很多 vim 的颜色设置(scheme)，我在其中找了一个顺眼的，想在其基础上作一点小修改。

因为我已经习惯了在终端中使用 vim，所以有些没设置 ctermfg/ctermbg 而只设置了 guifg/guibg 的 scheme 我就忽略了。

终端我现在用的是 mlterm，感觉很好。只是在 UTF-8 格式下启用 fcitx 有点问题：公司的机器好好的，家里的机器就不行。

要想在 mlterm 中让 vim 显示黑色的粗体，要修改(scheme).vim 文件，把需要显示为黑色粗体的行改成如：

    hi Comment          ctermfg=darkgrey ctermbg=none

如果还要加其它如下划线、斜体等属性，记得把 cterm=underline、cterm=italic 放在 ctermfg/ctermbg 之后
