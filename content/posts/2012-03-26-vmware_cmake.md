---
categories:
- var
date: "2012-03-26T00:00:00Z"
tags:
- vmware
- cmake
title: vmware cmake
---

VMware虚拟机的静态Mac地址

    uuid.location = "56 4d ed e8 a5 51 fb 34-af 24 5c c7 c5 b8 5a 43"
    uuid.bios = "56 4d ed e8 a5 51 fb 34-af 24 5c c7 c5 ea 51 18"       # 手工指定最后三位
    ethernet0.addressType = "generated"                                 # 在自动生成基础上自定义的Mac
    ethernet0.generatedAddress = "00:0c:29:ea:51:18"                    # 保持最后三位与uuid.bios一致
    ethernet0.generatedAddressOffset = "0"
    
    ethernet1.addressType = "static"
    ethernet2.addressType = "static"                                    # 完全自定义的Mac地址
    ethernet1.address = 00:50:56:38:5a:4d                               # 范围必须介于:
    ethernet2.address = 00:50:56:38:5a:57                               # 00:50:56:00:00:00 - 00:50:56:3F:FF:FF

cmake编译、安装、删除

    1# mkdir build
    2# cd build
    3# cmake ../
    4# build
    5# sudo make install
    6# sudo xargs rm < install_manifest.txt

