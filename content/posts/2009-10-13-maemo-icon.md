---
date: "2009-10-13T00:00:00Z"
tags: dev/gtk
title: Maemo icon
---

RT @<http://thpinfo.com/2008/02/maemo-icon-sizes.html>

I had a hard time finding out which icon sizes one has to provide and
where to install them for Maemo applications (I'm currently developing
for OS2008 "chinook", might be different for other releases). Here is
what I found out by looking at the contents of other GUI packages:

26x26 icon goes to /usr/share/icons/26x26/hildon/appname.png
40x40 icon goes to /usr/share/icons/40x40/hilson/appname.png
64x64 icon goes to /usr/share/icons/scalable/hildon/appname.png

The 64x64 icon will be used in the menu, so be sure to make it really 64x64,
otherwise the icon will look out of place in the menu. Also, be sure to create
an executable "postinst" file in the "debian/" subdirectory of your package
source that has at least the following two commands:

gtk-update-icon-cache -f /usr/share/icons/hicolor
maemo-select-menu-location appname.desktop

Where of course "appname" is the name of your application and how you
named your icon and .desktop file.
