---
date: "2010-12-16T00:00:00Z"
tags: b/文档/3/a
title: make toc support for jekyll with rdiscount
---

Table Of Contents(toc) 就是目录，按标题的纵深分类汇总，方便内容间快速跳转。
rdiscount 支持 toc，需要在创建 RDiscount 对象时添加 ``:generate_toc`` 参数:

    markdown = RDiscount.new(content, :generate_toc)

然后通过 ``toc_content`` 方法输出 toc 内容:

    mardown.toc_content

``Jekyll (<= 0.9.0)`` 用 rdiscount 作 markdown 语法转换程序时，未能支持 toc
输出。为此我修改了一段代码改进 jekyll 对 toc 的支持:

    /var/lib/gems/1.8/gems/jekyll-0.8.0/lib/jekyll/converters/markdown.rb

```diff
 markdown.rb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git markdown.rb markdown.rb
index 00c56d7..09c53ed 100644
--- markdown.rb
+++ markdown.rb
@@ -103,7 +103,8 @@ module Jekyll
             }).to_html
           end
         when 'rdiscount'
-          RDiscount.new(content, *@rdiscount_extensions).to_html
+          markdown = RDiscount.new(content, *@rdiscount_extensions)
+          markdown.toc_content + markdown.to_html
         when 'maruku'
           Maruku.new(content).to_html
       end
```

