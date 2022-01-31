---
categories:
- bin
date: "2008-05-21T00:00:00Z"
tags:
- hack
- asciidoc
title: "asciidoc pdf fop ä¸­æ\x96\x87"
---

通过 fop，将由 Asciidoc 生成的 Docbook 文件转换成 Pdf 文档。支持中文(必须是 ttf 字体)。

    1. 根据 asciidoc 规则编写文档
    / 2. 由 asciidoc 生成
    |/ 3. 由 xsltproc 生成
    ||/ 4. 由 fop 生成
    |||/
    *    foo.txt  asciidoc 源代码
     *   foo.xml  docbook 源代码
      *  <a href="http://foo.fo">foo.fo</a>   fo 源代码
       * foo.pdf  PDF 文档</tt></pre>

经过配置，以上 4 步可由一个命令完成。

## 安装工具

    % sudo apt-get install asciidoc fop xsltproc sun-java5-jre source-highlight docbook-xsl libxext6

## 简单配置
自行修改 /etc/asciidoc/docbook-xsl/fo.xsl 以便支持中文，这里之列出差异
```diff
diff --git a/docbook-xsl/fo.xsl b/docbook-xsl/fo.xsl
index 37e1de4..f99fc3e 100644
--- a/docbook-xsl/fo.xsl
+++ b/docbook-xsl/fo.xsl
@@ -25,7 +25,9 @@
<!-- justify, left or right -->
left</xsl:param>

-<xsl:param name="body.font.family" select="'serif'"/>
+<xsl:param name="sans.font.family" select="'SimSun'"/>
+<xsl:param name="title.font.family" select="'SimHei'"/>
+<xsl:param name="body.font.family" select="'SimSun'"/>
 <xsl:param name="body.font.master">12</xsl:param>
 <xsl:param name="body.font.size">
 <xsl:value-of select="$body.font.master"/><xsl:text>pt</xsl:text>
```

添加源代码高亮支持

    % sudo cp /usr/share/doc/asciidoc/examples/so*/so*.conf /etc/asciidoc/filters/

准备 fop 可识别的字体配置文件
拷贝 simsun.ttf 和 simhei.ttf，这里假设拷贝到 /sun/backup/fonts 目录

    % export FONTDIR=/sun/backup/fonts/
    % cp simsun.ttf simhei.ttf $FONTDIR

在工作目录下创建字体模板，建议直接在用户家目录下创建

    % cd
    % fop-ttfreader -ttcname "simsun" $FONTDIR/simsun.ttf ~/.fop.simsun
    % fop-ttfreader -ttcname "simhei" $FONTDIR/simhei.ttf ~/.fop.simhei

在工作目录下创建字体配置文件，建议直接在用户家目录下创建

    % vi ~/.fop.conf

```xml
<?xml version="1.0"?>
<fop version="1.0">
<base>.</base>
  <renderers>
   <renderer mime="application/pdf">
      <filterList>
         <value>flate</value>
    </filterList>
     <fonts>
       <font metrics-file="/sun/home/.fop.simsun" kerning="yes" embed-file='/sun/backup/fonts/simsun.ttf'>
         <font-triplet name="SimSun" style="normal" weight="normal"/>
         <font-triplet name="SimSun" style="italic" weight="normal"/>
       </font>
        <font metrics-file="/sun/home/.fop.simhei" kerning="yes" embed-file='/sun/backup/fonts/simhei.ttf'>
         <font-triplet name="SimHei" style="normal" weight="normal"/>
         <font-triplet name="SimHei" style="italic" weight="normal"/>
         <font-triplet name="SimHei" style="normal" weight="bold"/>
         <font-triplet name="SimHei" style="italic" weight="bold"/>
        </font>
     </fonts>
   </renderer>
</renderers>
</fop>

```

## Warning
上面 metrics-file 和 embed-file 随后的路径必须是绝对路径 (在这里 ~/ 不被认为是 绝对路径)。我的用户家目录是 /sun/home，你的可能是 /home/YOUR。请自行更正。

自行编辑 /usr/bin/a2x 脚本简化 PDF 生成步骤，这里只列出差异
```diff
diff --git a/a2x b/a2x
index 5ea63cb..77e7176 100755
--- a/a2x
+++ b/a2x
@@ -487,7 +487,7 @@ function to_pdf()
      to_docbook
     execute_command_2 "xsltproc $XSLTPROC_OPTS --nonet \
         \"$xsl\" \"$xml\" >\"$fo\""
-    execute_command_2 "fop \"$fo\" \"$pdf\""
+    execute_command_2 "fop -c ~/.fop.conf \"$fo\" \"$pdf\""
 }

 function to_text()
```

## 测试试用
[下载](http://people.openrays.org/%7Es5unty/contrib/asciidoc2pdf/index.txt) 本页的 asciidoc 代码，生成 PDF 文档:

    % a2x -f pdf index.txt
