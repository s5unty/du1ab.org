---
date: "2009-08-18T00:00:00Z"
tags: dev/c
title: libtool/aclocal error
---

RT @<http://tolstoy.newcastle.edu.au/R/e6/devel/09/06/2037.html>

> libtool: Version mismatch error. This is libtool 2.2, but the
> libtool: definition of this LT_INIT comes from libtool 2.2.6.
> libtool: You should recreate aclocal.m4 with macros from libtool 2.2
> libtool: and run autoconf again. __

按照提示要求修改 ltmain.sh 中的 VERSION 和 package_revision 即可解决
