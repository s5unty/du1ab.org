---
date: "2012-06-24T00:00:00Z"
tags: [google, txt/文档]
title: Google Earth 6 中文乱码
---

从官网下载的32位deb包，装好之后运行，界面上方菜单、左侧菜单显示为乱码，地图上的中文有些也是乱码。

网上很多同学都说，用系统默认的QT库替换程序自带的QT库可以解决中文乱码的问题，但是启动程序时失败：

    ./googleearth-bin: symbol lookup error: ./librender.so: undefined symbol: _Z34QBasicAtomicInt_fetchAndAddOrderedPVii

google发现，debian 中有一个软件包 googleearth-package，试试有没有新的发现：

    $ sudo make-googleearth-package --force
    ...
    Architecture: i386
    Depends: ttf-dejavu | ttf-bitstream-vera | msttcorefonts, lsb-core, libqtcore4, libgl1-mesa-glx,
    Suggests:
    Description: Google Earth, a 3D map/planet viewer
    Package built with googleearth-package.
    dpkg-deb: error: parsing file '/tmp/googleearth-deb/DEBIAN/control' near line 7 package 'googleearth':
    `Depends' field, missing package name, or garbage where package name expected
    Success!
    You can now install the package with e.g. sudo dpkg -i <package>.deb

参考[这里][1]修改了 /usr/bin/make-googleearth-package，删除了 libgl1-mesa-glx 后面的逗号，重新编译：

    $ sudo make-googleearth-package --force
    ...
    Architecture: i386
    Depends: ttf-dejavu | ttf-bitstream-vera | msttcorefonts, lsb-core, libqtcore4, libgl1-mesa-glx  
    Suggests: 
    Description: Google Earth, a 3D map/planet viewer
     Package built with googleearth-package.
    dpkg-deb：正在新建软件包 googleearth，包文件为 ./googleearth_6.0.3.2197+0.6.0-1_i386.deb。
    Success!
    You can now install the package with e.g. sudo dpkg -i <package>.deb

dpkg 安装成功后，还是准备用系统QT替换程序QT，但是程序在启动时直接崩溃：

    % googleearth
    Google Earth has caught signal 11.
    
    
    
    We apologize for the inconvenience, but Google Earth has crashed.
     This is a bug in the program, and should never happen under normal
     circumstances. A bug report and debugging data have been written
     to this text file:
    
        /sun/.googleearth/crashlogs/crashlog-4fe6a51b.txt
    
    Please include this file if you submit a bug report to Google.

后来找到[这里][2]，修改了 /usr/bin/googleearth 脚本，在 googleearth-bin 之前添加了以下两行：

    LANG=zh_CN.UTF-8
    export LD_PRELOAD=/usr/lib/libfreeimage.so.3

再启动 googleearth，上方的菜单、左侧的菜单、地图中照片的描述、地名等内容，都可以正常显示中文了。

    % lsb_release -a
    LSB Version:	core-2.0-ia32:core-2.0-noarch:core-3.0-ia32:core-3.0-noarch:core-3.1-ia32:core-3.1-noarch:core-3.2-ia32:core-3.2-noarch
    Distributor ID:	Debian
    Description:	Debian GNU/Linux 6.0.5 (squeeze)
    Release:	6.0.5
    Codename:	squeeze
    % dpkg -l | grep -e "earth\|libfreeimage\|lsb-core\|libqt4-core\|libqt4-webkit\|libqt4-network\|libqt4-gui"
    ii  googleearth                                     6.0.3.2197+0.6.0-1                     Google Earth, a 3D map/planet viewer
    ii  googleearth-package                             0.6.1                                  utility to automatically build a Debian package of Google Earth
    ii  libfreeimage3                                   3.10.0-4                               Support library for graphics image formats (library)
    ii  libqt4-core                                     4:4.6.3-4+squeeze1                     transitional package for Qt 4 core non-GUI runtime libraries
    ii  libqt4-gui                                      4:4.6.3-4+squeeze1                     transitional package for Qt 4 GUI runtime libraries
    ii  libqt4-network                                  4:4.6.3-4+squeeze1                     Qt 4 network module
    ii  libqt4-webkit                                   4:4.6.3-4+squeeze1                     Qt 4 WebKit module
    ii  lsb-core                                        3.2-23.2squeeze1                       Linux Standard Base 3.2 core support package

[1]: https://www.linuxquestions.org/questions/debian-26/google-earth-will-not-install-with-googleearth-package-914604/
[2]: http://blog.cathayan.org/item/2230
