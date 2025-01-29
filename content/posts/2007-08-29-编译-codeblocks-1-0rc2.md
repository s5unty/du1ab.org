---
date: "2007-08-29T00:00:00Z"
tags: ide/code-blocks
title: "编译CodeBlocks 1.0RC2"
---

下载后解压

    1$ cd /some/where/codeblocks-1.0rc2
    2$ find . -type f -and -not -name "*.cpp" -and -not -name "*.h" -and -not -name "*.png" -and -not -name "*.bmp" | sed "s/.*/\"\\0\"/" | xargs dos2unix 
    3$ ./bootstrap
    4$ ./configure --prefix=/opt/codeblocks
    5$ make
    ...
    ...
    ./editormanager.h :129: error: extra qualification 'EditorManager :: ' on member 'GetTree'
    ./managedthread.h :14: error: extra qualification 'ManagedThread :: ' on member 'ManagedThread' 
    ./managedthread.h :15: error: extra qualification 'ManagedThread :: ' on member 'ManagedThread'
    ./xtra_classes.h :21: error: extra qualification 'wxSplitPanel :: ' on member 'wxSplitPanel'
    ./xtra_classes.h :24: error: extra qualification 'wxSplitPanel :: ' on member 'wxSplitPanel' 
    ./xtra_classes.h :36: error: extra qualification 'wxSplitPanel :: ' on member 'RefreshSplitter'
    ./xtra_classes.h :38: error: extra qualification 'wxSplitPanel :: ' on member 'wxSplitPanel'
    6$ make
    7$ make insatll

编辑以上文件的错误行，如 editormanager.h :129 行：
wxTreeCtrl EditorManager::*GetTree();
改成：
wxTreeCtrl *GetTree();

每个文件修改完成后，重新编译(中途还会遇到类似错误)
