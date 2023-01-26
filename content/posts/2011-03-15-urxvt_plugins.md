---
date: "2011-03-15T00:00:00Z"
tags: b/命令行/10/a
title: urxvt plugins
---

rxvt-unicode，支持 unicode 的 rxvt，多以 urxvt 名称出现。它集成了 perl 解释器(不需要外部 perl 环境？)，提供了 API。你可以把这种用于定制 urxvt 行为的 perl 脚本称为扩展，我喜欢叫它插件。

urxvt 本身内置了若干插件，例如支持标签页的插件 tabbed、双击匹配并选中既定内容的插件 selection、单击特定内容执行既定命令的插件 matcher 等。更多信息可参考 `man urxvtperl`。

## 内置插件

    $ man urxvtperl | grep "enabled by default"
           selection (enabled by default)
           option-popup (enabled by default)
           selection-popup (enabled by default)
           searchable-scrollback<hotkey> (enabled by default)
           readline (enabled by default)

上列默认启用的内置插件所实现的功能大致如下

* selection
  通过内置的正则表达式，在用户双击或三击时，自动选中符合正则表达式匹配规则的内容

* option-popup
  任何时刻通过 Ctrl+鼠标中键 弹出菜单，可即时动态修改 urxvt 的设置

* selection-popup
  在有内容被选中时通过 Ctrl+鼠标右键 弹出菜单，实现对被选内容的高级处理

* searchable-scrollback
  任何时刻通过 Alt-S 进入反向搜索模式，可搜索当前 urxvt 终端显示过的历史信息

* readline
  提供额外的鼠标选取功能，包括 Shift+鼠标 的按行选取、Shift+Alt+鼠标 的按列选取。在设定了 `set mouse=a` 的 vim 编辑器中此功能显得更加突出。

## 非内置插件

对于默认没有启用的插件，以及自制的插件，需要修改 urxvt 的配置文件 ~/.Xresources，添加类似的下列内容
    URxvt.perl-lib:          /sun/.urxvt/
    URxvt.perl-ext-common:   matcher,mark-yank-urls,vim-scrollback,translate-selection
即定义 urxvt 插件所在目录；启用 4 个额外插件，逗号分割。
    % ls /sun/.urxvt/
    mark-yank-urls  translate-selection  vim-scrollback
由于 matcher 是内置的插件，所以不需要在自定义的 urxvt 插件目录中存在。

* 选中单词后快速本地翻译 (translate-selection)
* 快速打开或复制网址内容 (mark-yank-urls)
* Vim 风格的终端历史导航 (vim-scrollback)

