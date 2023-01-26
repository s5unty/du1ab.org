---
date: "2009-08-19T00:00:00Z"
tags: b/编程/4/h
title: use x86 to test and armel only for cc
---

RT @<http://n2.nabble.com/Not-getting-hildon-theme-for-Armel-terget-and-unable-to-build-for-Armel-terget-td2953653.html>

please use the x86 target to test your applications and the armel target *only*
for cross compiling. starting the window from the armel target will fail. For
further information please have a look at the release notes [1].

And the mmap issue is handled here now [2] I guess ;)

[1]: http://repository.maemo.org/stable/4.1.2/maemo-sdk-relnotes_4.1.2.txt
[2]: http://maemo.org/community/maemo-developers/not_able_to_build_application_for_armel_terget
