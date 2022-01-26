---
categories:
- bin
date: "2008-12-08T00:00:00Z"
tags:
- java
- eclipse
title: 'eclipse: undefined symbol: _ZN4nsID5ParseEPKc'
---

RT @<http://groups.google.com/group/linux.debian.bugs.dist/browse_thread/thread/233eb5085eeeede0>

    ~$ eclipse
    searching for compatible vm... 
    testing /usr/lib/jvm/java-6-openjdk...found 
    /usr/lib/jvm/java-6-openjdk/bin/java: symbol lookup error: 
    /home/s230984/.eclipse/org.eclipse.platform_3.2.0/configuration/org.eclipse.osgi/bundles/81/1/.cp/libswt-mozilla-gtk-3236.so: 
    undefined symbol: _ZN4nsID5ParseEPKc 

installing **xulrunner-dev** seems to fix this. 

