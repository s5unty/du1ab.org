---
categories:
- var
date: "2006-12-10T00:00:00Z"
tags: []
title: How to customize splash.rle
---

from <a href="http://www.mail-archive.com/debian-custom@lists.debian.org/msg01357.html">http://www.mail-archive.com/debian-custom@lists.debian.org/msg01357.html</a>
<pre>Matheus Morais <[EMAIL PROTECTED]> wrote:
 > I'm looking to create my own rle splash image on boot start. How I can do
> this? GIMP can convert jpg or png in rle?

1. create a new splash.png file (using gimp or whatever)

2. convert it to "pnm" by using "pngtopnm" 
    % pngtopnm splash.png > splash.pnm

3. convert it to "rle" by using "ppmtolss16"
     % ppmtolss16 "#000000=0" "#ffffff=7" < splash.pnm > splash.rle</pre>
