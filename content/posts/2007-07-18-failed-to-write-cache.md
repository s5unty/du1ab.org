---
categories:
- var
date: "2007-07-18T00:00:00Z"
tags: []
title: failed to write cache
---

执行fc-cache -v时得到错误信息：

    [/sun/home]# fc-cache -v
    /usr/share/fonts: caching, 0 fonts, 4 dirs 
    /usr/share/fonts: failed to write cache
    /usr/share/fonts/X11: caching, 0 fonts, 6 dirs
    /usr/share/fonts/X11: failed to write cache
    /usr/share/fonts/X11/100dpi: caching, 0 fonts, 0 dirs
    /usr/share/fonts/X11/100dpi: failed to write cache 
    /usr/share/fonts/X11/75dpi: caching, 0 fonts, 0 dirs
    /usr/share/fonts/X11/75dpi: failed to write cache
    /usr/share/fonts/X11/Type1: caching, 8 fonts, 0 dirs
    /usr/share/fonts/X11/Type1: failed to write cache
     /usr/share/fonts/X11/encodings: caching, 0 fonts, 1 dirs
    /usr/share/fonts/X11/encodings: failed to write cache
    /usr/share/fonts/X11/encodings/large: caching, 0 fonts, 0 dirs
    /usr/share/fonts/X11/encodings/large: failed to write cache 
    /usr/share/fonts/X11/misc: caching, 0 fonts, 0 dirs
    /usr/share/fonts/X11/misc: failed to write cache
    /usr/share/fonts/X11/util: caching, 0 fonts, 0 dirs
    /usr/share/fonts/X11/util: failed to write cache
    /usr/share/fonts/truetype: caching, 0 fonts, 22 dirs 
    /usr/share/fonts/truetype: failed to write cache
    /usr/share/fonts/truetype/arphic: caching, 2 fonts, 0 dirs
    /usr/share/fonts/truetype/arphic: failed to write cache
    /usr/share/fonts/truetype/baekmuk: caching, 4 fonts, 0 dirs 
    /usr/share/fonts/truetype/baekmuk: failed to write cache
    /usr/share/fonts/truetype/freefont: caching, 12 fonts, 0 dirs
    /usr/share/fonts/truetype/freefont: failed to write cache
    /usr/share/fonts/truetype/kochi: caching, 4 fonts, 0 dirs 
    /usr/share/fonts/truetype/kochi: failed to write cache
    /usr/share/fonts/truetype/openoffice: caching, 1 fonts, 0 dirs
    /usr/share/fonts/truetype/openoffice: failed to write cache
    /usr/share/fonts/truetype/thai: caching, 23 fonts, 0 dirs 
    /usr/share/fonts/truetype/thai: failed to write cache
    /usr/share/fonts/truetype/ttf-arabeyes: caching, 39 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-arabeyes: failed to write cache
    /usr/share/fonts/truetype/ttf-bengali-fonts: caching, 7 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-bengali-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-bitstream-vera: caching, 10 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-bitstream-vera: failed to write cache
    /usr/share/fonts/truetype/ttf-dejavu: caching, 21 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-dejavu: failed to write cache
    /usr/share/fonts/truetype/ttf-devanagari-fonts: caching, 5 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-devanagari-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-gentium: caching, 4 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-gentium: failed to write cache
    /usr/share/fonts/truetype/ttf-gujarati-fonts: caching, 5 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-gujarati-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-kannada-fonts: caching, 8 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-kannada-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-lao: caching, 1 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-lao: failed to write cache
    /usr/share/fonts/truetype/ttf-malayalam-fonts: caching, 1 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-malayalam-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-mgopen: caching, 16 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-mgopen: failed to write cache
    /usr/share/fonts/truetype/ttf-oriya-fonts: caching, 1 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-oriya-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-punjabi-fonts: caching, 2 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-punjabi-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-tamil-fonts: caching, 9 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-tamil-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-telugu-fonts: caching, 2 fonts, 0 dirs
    /usr/share/fonts/truetype/ttf-telugu-fonts: failed to write cache
    /usr/share/fonts/truetype/ttf-xfree86-nonfree: caching, 12 fonts, 0 dirs 
    /usr/share/fonts/truetype/ttf-xfree86-nonfree: failed to write cache
    /usr/share/fonts/type1: caching, 0 fonts, 1 dirs
    /usr/share/fonts/type1: failed to write cache
    /usr/share/fonts/type1/gsfonts: caching, 35 fonts, 0 dirs 
    /usr/share/fonts/type1/gsfonts: failed to write cache
    /usr/share/fonts/zh_CN: caching, 0 fonts, 1 dirs
    /usr/share/fonts/zh_CN: failed to write cache
    /usr/share/fonts/zh_CN/truetype: caching, 4 fonts, 0 dirs
     /usr/share/fonts/zh_CN/truetype: failed to write cache
    /usr/share/X11/fonts: "/usr/share/X11/fonts": not a directory, skipping
    /usr/local/share/fonts: caching, 0 fonts, 1 dirs
    /usr/local/share/fonts: failed to write cache 
    /usr/local/share/fonts/truetype: caching, 7 fonts, 0 dirs
    /usr/local/share/fonts/truetype: failed to write cache
    /usr/share/fonts/zh_CN/truetype: skipping, looped directory detected
    /sun/home/.fonts: caching, 0 fonts, 0 dirs 
    /sun/home/.fonts: failed to write cache
    /var/lib/defoma/fontconfig.d: caching, 0 fonts, 24 dirs
    /var/lib/defoma/fontconfig.d: failed to write cache
    /var/lib/defoma/fontconfig.d/A: caching, 8 fonts, 0 dirs
     /var/lib/defoma/fontconfig.d/A: failed to write cache
    /var/lib/defoma/fontconfig.d/B: caching, 11 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/B: failed to write cache
    /var/lib/defoma/fontconfig.d/C: caching, 6 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/C: failed to write cache
    /var/lib/defoma/fontconfig.d/D: caching, 23 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/D: failed to write cache
    /var/lib/defoma/fontconfig.d/E: caching, 1 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/E: failed to write cache
    /var/lib/defoma/fontconfig.d/F: caching, 13 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/F: failed to write cache
    /var/lib/defoma/fontconfig.d/G: caching, 12 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/G: failed to write cache
    /var/lib/defoma/fontconfig.d/H: caching, 4 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/H: failed to write cache
    /var/lib/defoma/fontconfig.d/J: caching, 2 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/J: failed to write cache
    /var/lib/defoma/fontconfig.d/K: caching, 6 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/K: failed to write cache
    /var/lib/defoma/fontconfig.d/L: caching, 18 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/L: failed to write cache
    /var/lib/defoma/fontconfig.d/M: caching, 19 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/M: failed to write cache
    /var/lib/defoma/fontconfig.d/N: caching, 23 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/N: failed to write cache
    /var/lib/defoma/fontconfig.d/O: caching, 2 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/O: failed to write cache
    /var/lib/defoma/fontconfig.d/P: caching, 5 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/P: failed to write cache
    /var/lib/defoma/fontconfig.d/R: caching, 3 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/R: failed to write cache
    /var/lib/defoma/fontconfig.d/S: caching, 7 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/S: failed to write cache
    /var/lib/defoma/fontconfig.d/T: caching, 10 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/T: failed to write cache
    /var/lib/defoma/fontconfig.d/U: caching, 13 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/U: failed to write cache
    /var/lib/defoma/fontconfig.d/V: caching, 1 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/V: failed to write cache
    /var/lib/defoma/fontconfig.d/a: caching, 1 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/a: failed to write cache
    /var/lib/defoma/fontconfig.d/j: caching, 1 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/j: failed to write cache
    /var/lib/defoma/fontconfig.d/m: caching, 4 fonts, 0 dirs 
    /var/lib/defoma/fontconfig.d/m: failed to write cache
    /var/lib/defoma/fontconfig.d/u: caching, 1 fonts, 0 dirs
    /var/lib/defoma/fontconfig.d/u: failed to write cache
    fc-cache: failed

如果是在Ubuntu升级过程中遇到这个问题，可以用 

    find /usr/share/fonts -exec touch "{}" \;
    find /usr/share/fonts/X11 -exec touch "{}" \;
    find /usr/share/fonts/truetype -exec touch "{}" \;
    find /var/lib/defoma/fontconfig.d -exec touch "{}" \; 
    find $(你fc-cache得到的其它路径) -exec touch "{}" \;

但我遇到的问题是由于混用了apt源，错误的/etc/fonts/fonts.conf文件导致fc-cache失败。参考：

<http://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg250811.html>
