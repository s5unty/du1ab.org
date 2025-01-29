---
date: "2006-12-11T00:00:00Z"
tags: [os, font/字体]
title: ubuntu使用simsun字体
---

拷贝字体文件

    mkdir -p /usr/share/fonts/zh_CN/truetype/
    sudo cp /media/hda1/windows/fonts/simsun.ttc /usr/share/fonts/zh_CN/truetype/
    sudo cp /media/hda1/windows/fonts/SURSONG.TTF /usr/share/fonts/zh_CN/truetype/
    sudo cp /media/hda1/windows/fonts/tahoma.ttf /usr/share/fonts/zh_CN/truetype/
    sudo cp /media/hda1/windows/fonts/tahomabd.ttf /usr/share/fonts/zh_CN/truetype/
    sudo chmod 644 /usr/share/fonts/zh_CN/truetype/*

更新字体缓冲

    cd /usr/share/fonts/zh_CN/truetype/
    sudo mkfontscale
    sudo mkfontdir
    sudo fc-cache /usr/share/fonts/zh_CN/truetype/

修改字体显示的优先级

    sudo vi /etc/fonts/language-selector.conf
    <fontconfig>
            <alias>
                    <family>serif</family>
                    <prefer>
                            <family>Bitstream Vera Serif</family>
                            <family>SimSun</family>　　　　<-- 添加这行
                            <family>DejaVu Serif</family>
                            <family>AR PL ShanHeiSun Uni</family>
                            <family>WenQuanYi Bitmap Song</family>
                            <family>AR PL ZenKai Uni</family>
                    </prefer>
            </alias>
            <alias>
                    <family>sans-serif</family>
                    <prefer>
                            <family>Bitstream Vera Sans</family>
                            <family>SimSun</family>　　　　<-- 添加这行
                            <family>DejaVu Sans</family>
                            <family>AR PL ShanHeiSun Uni</family>
                            <family>WenQuanYi Bitmap Song</family>
                            <family>AR PL ZenKai Uni</family>

                    </prefer>
            </alias>
            <alias>
                    <family>monospace</family>
                    <prefer>
                            <family>Bitstream Vera Sans Mono</family>
                            <family>SimSun</family>　　　<-- 添加这行
                            <family>DejaVu Sans Mono</family>
                            <family>AR PL ShanHeiSun Uni</family>
                            <family>WenQuanYi Bitmap Song</family>
                            <family>AR PL ZenKai Uni</family>
                    </prefer>
    ...

