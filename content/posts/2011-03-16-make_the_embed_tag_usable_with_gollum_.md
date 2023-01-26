---
date: "2011-03-16T00:00:00Z"
tags: [b/文档/6, b/编程/6/f]
title: make the embed tag usable with gollum
---

[gollumi][1], 一个简单的，git 驱动的维基程序。

* 种类丰富的格式化语言可供选择
* 页面修改历史的版本对比
* 中文全文搜索
* 支持代码高亮
* 编辑时可预览

```sh
1% sudo gem install gollum
2% mkdir /tmp/gollum; cd /tmp/gollum
3% git init 
4% /var/lib/gems/1.8/bin/gollum
```

通过 `gem install gollum` 安装后无须配置(1)，初始化一个 git 仓库(2-3)，接着运行 gollum 会启动一个本地的网页服务器(4)，此时用浏览器打开 http://localhost:4567 即可使用。

修改 `/var/lib/gems/1.8/gems/gollum-1.1.1/lib/` 目录下的 gollum.rb 文件，添加对 flash 视频显示的支持。

```diff
--- gollum.rb.orig	2011-03-16 14:20:50.762483229 +0800
+++ gollum.rb	2011-03-17 09:46:37.968495554 +0800
@@ -24,6 +24,7 @@
 
   SANITIZATION_OPTIONS = {
     :elements => [
+      'embed',
       'a', 'abbr', 'acronym', 'address', 'area', 'b', 'big',
       'blockquote', 'br', 'button', 'caption', 'center', 'cite',
       'code', 'col', 'colgroup', 'dd', 'del', 'dfn', 'dir',
@@ -36,6 +37,8 @@
       'thead', 'tr', 'tt', 'u', 'ul', 'var'
     ],
     :attributes => {
+      'embed'  => ['src', 'type', 'quality', 'allowScriptAccess',
+                   'width', 'height'],
       :all => ['abbr', 'accept', 'accept-charset',
                'accesskey', 'action', 'align', 'alt', 'axis',
                'border', 'cellpadding', 'cellspacing', 'char',

```

[1]: https://github.com/github/gollum
