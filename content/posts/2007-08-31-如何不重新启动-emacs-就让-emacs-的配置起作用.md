---
date: "2007-08-31T00:00:00Z"
tags: ide/emacs
title: 如何不重新启动 emacs 就让 emacs 的配置起作用
---

FROM: <http://ann77.stu.cdut.edu.cn/EmacsDotEmacsWithoutRestart.html>

- 用 emacs 打开 .emacs 文件，C-x C-e 光标前面的运行一条语句。立即生效。
- 选择一个 region , M-x eval-region
- M-x load-file ~/.emacs
- M-x eval-buffer
