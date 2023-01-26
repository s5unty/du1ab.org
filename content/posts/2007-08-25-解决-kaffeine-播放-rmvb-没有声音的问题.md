---
date: "2007-08-25T00:00:00Z"
tags: b/操作系统/4/d
title: 解决 kaffeine 播放 rmvb 没有声音的问题
---

FROM: <http://forum.ubuntu.org.cn/about55743.html&sid=70894dfd450e292811c3aa3a5c2d8541>

如果使用 xine 后端的播放器，如 kaffeine, xine, totem-xine 等等播放器在播放有些 rmvb 的文件的时候会出现没有声音的现象（如果你没遇到，就不要进行这一步了），解决办法如下：  

首先关闭播放器，然后使用你喜欢的编辑器，比如 kate, gedit, vim 等打开文件 ~/.xine/catalog.cache，(比如 kate ~/.xine/catalog.cache 打开该文件)。找到其中的  

    /usr/lib/xine/plugins/1.1.4/xineplug_decode_real_audio.so  
  
代码段，将其下的 decoder_priority 的数值修改成 10。修改完毕后这一段应该看起来是这样子的  

    /usr/lib/xine/plugins/1.1.4/xineplug_decode_real_audio.so 
    .... 
    .... 
    decoder_priority=10 
