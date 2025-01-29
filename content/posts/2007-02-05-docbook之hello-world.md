---
date: "2007-02-05T00:00:00Z"
tags: txt/文档
title: DocBook之Hello World
---

FROM: <http://workaround.org/moin/DocBook>

- xsltproc
  XSL Transformations Processor

- docbook-xsl
  stylesheets for HTML, XHTML, HTML Help and others

首先安装这两个工具

    sudo apt-get install xsltproc docbook-xsl 

把以下内容存入一个名为test.xml的文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE article
    PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
    "http://docbook.org/xml/4.2/docbookx.dtd">
<article>
  <title>My first Docbook document</title>
  <sect1>
     <title>The greeting</title>
     <para>
       Hello world
     </para>
  </sect1>
</article>
```

执行以下命令，并用浏览器打开test.html。

    xsltproc -o test.html /usr/share/xml/docbook/stylesheet/nwalsh/xhtml/docbook.xsl test.xml
