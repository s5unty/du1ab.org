---
date: "2007-02-13T00:00:00Z"
tags: b/编程/3
title: GTK_on_DirectFB
---

参照这里的指导：<http://directfb.org/wiki/index.php/Projects:GTK_on_DirectFB>

1. apt 源中没有 libdirectfb-0.9-25

        apt-get install libglib2.0-0 libglib2.0-dev libatk1.0-0 libatk1.0-dev libpango1.0-0 libpango1.0-dev libdirectfb-dev

    后来我下载并编译 DirectFB-1.0.0-rc4，在编译时我的经验是把 prefix 指定为/usr 目录，否则会引起当前编译版本和系统自带版本的冲突，导致运行的 DirectFB 测试程序总是死机。

2. 为了调试 DirectFB 程序方便，为 DirectFB-1.0.0-rc4 安装 sdl 支持

        sudo apt-get install libsdl1.2-dev

    我的经验步骤就是：

        0$ export ws=/tmp/gtkdfb/ 
        1$ apt-get install libglib2.0-0 libglib2.0-dev libatk1.0-0 libatk1.0-dev libpango1.0-0 libpango1.0-dev libdirectfb-dev libsdl1.2-dev
        2$ cd $ws && wget http://directfb.org/downloads/Core/DirectFB-1.0.0-rc4.tar.gz
        3$ tar zxf *.tar.gz && cd DirectFB-1.0.0-rc4
        4$ ./configure --prefix=/usr --enable-sdl --enable-multi --enable-trace --enable-debug 
        ...
        Build options:
          Version                   1.0.0-rc4
          Install prefix            /usr
          Build shared libs         yes
          Build static libs         no
          Module directory          ${exec_prefix}/lib/directfb-1.0-0
          CPPFLAGS                  -D_REENTRANT
          CFLAGS                    -O3 -ffast-math -pi
        
        -g -g3 -fno-inline -D_GNU_SOURCE  -finstrument-functions -Werror-implicit-function-declaration
          LDFLAGS
          LIBS                      -ldl -lpthread
        
        Misc options:
          Multi Application Core    yes
          Voodoo (network support)  no
          Debug supported           yes
          Debug enabled             yes
          Trace support             yes
          MMX support               yes
          SSE support               yes
          Network support           yes
          zlib compression          no
          sysfs support             no
        
        Building Core Systems:
          Linux FBDev support       yes
          X11 support               no
          OSX support               no
          SDL support               yes
          VNC support               no
        
        Building WM Modules:
          Default                   yes
          UniQuE                    no
        
        Building Tests              no
        Building Tools              yes
        
        Building Image Providers:
          GIF                       yes
          JPEG                      yes
          MPEG2 I-Frame             yes
          PNG                       yes
        
        Building Video Providers:
          GIF                       yes
          Video4Linux               yes (v2: no)
        
        Building Font implementations:
          FreeType2                 yes
          Default font              yes
        
        Building Graphics Drivers:
          3Dfx Voodoo               yes
          ATI Mach64                yes
          ATI Rage 128              yes
          ATI Radeon                yes
          Intel i810                yes
          Intel i830                yes
          Matrox                    yes
          NeoMagic                  yes
          NSC Geode                 yes
          nVidia                    yes
          S3 Savage                 yes
          SiS 315                   yes
          TVIA CyberPro             yes
          VIA CLE266                no
          VIA UniChrome             yes
        
        Building Input Drivers:
          DBox2 Remote              no
          DreamBox Remote           no
          Dynapro Touchscreen       no
          ELO Touchscreen           no
          Gunze Touchscreen         no
          H3600 Touchscreen         no
          Joystick                  yes
          Keyboard                  yes
          Linux Input               yes
          LiRC                      yes
          MuTouch touchscreen       yes
          PS/2 Mouse                yes
          Serial Mouse              yes
          Sony
        
        Jogdial            yes
          tslib                     no
          ucb1x00 Touchscreen       no
          WM97xx Touchscreen        yes
        5$ make && sudo make install

    剩下的步骤和教程上的是完全一样的：

        6$ export PREFIX=/usr/gtkdfb; \
        export LD_LIBRARY_PATH=$PREFIX/lib; \
        export PKG_CONFIG_PATH=$LD_LIBRARY_PATH/pkgconfig; \
        export CFLAGS="-g"
        7$ cd $ws && wget <a href="http://cairographics.org/releases/cairo-1.2.4.tar.gz">http://cairographics.org/releases/cairo-1.2.4.tar.gz</a>
        8$ tar -xvzf cairo-1.2.4.tar.gz && cd cairo-1.2.4
        9$ sh configure --prefix=$PREFIX --enable-directfb --disable-xlib --disable-win32
        10$ make && sudo make install

        11$ cd $ws && svn co <a href="http://svn.gnome.org/svn/gtk+/trunk/">http://svn.gnome.org/svn/gtk+/trunk/</a> gtk+
        12$ cd gtk+
        13$ sh autogen.sh --prefix=$PREFIX --with-gdktarget=directfb --without-x
        14$ make && sudo make install

    最后就可以测试了

        1$ vi ~/.directfbrc
        -- 8< ------
        # 用 sdl 作为测试
        system=sdl
        -- 8< ------
        2$ sudo /usr/gtkdfb/bin/gtk-demo

    高兴的话，可以把 GIMP 也移植成 DirectFB

![](http://bp2.blogger.com/_oKL9t7fM3TU/RdF-iVxG6SI/AAAAAAAAACc/YsZudHk3vxE/s400/dfbterm.png)
