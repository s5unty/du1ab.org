---
date: "2010-09-20T00:00:00Z"
tags: ide/vi
title: 在脚本中使用 Vim Script [批]处理文件
---

RT @<http://superuser.com/questions/22455/vim-what-is-the-ex-mode-for-batch-processing-for>

Ex-Mode is mostly for performing the same action on a number of files. Say you have 25 .html files all with:

    <a href="/home.html"> ...

Instead of opening each one of those, you could use Ex-mode to change it all to **index.html**:

    vim -E -s bob.html <<-EOF
    	%substitute/home.html/index.html/
    	update
    	quit
    EOF

PS @[http://tinyurl.com/2f7dpgg](http://tinyurl.com/2f7dpgg)

    > also, make sure that last "eof" begins at the first column. If it
    > doesn't, the "here doc" won't recegnize it.

You should really quote some relevant text from the previous post...

Also, the "eof" marker in a heredoc does NOT have to start in the first column,
if you use this syntax, leading tabs will be stripped:

    some_command <<-eof
        blah
        blah
        blah
    eof

Note the "-e" after the "<<"...

Kevin
