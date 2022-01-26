---
categories:
- var
date: "2017-08-12T00:00:00Z"
tags:
- ubuntu
- debian
- kali
- stretch
title: SoftEther 编译报错的问题
---

SoftEther 在 Linux 下需要手动编译安装。不管是 [官网][ref-1] 还是 [Github][ref-2]，
下载的源码都无法成功编译，提示以下错误，

1. 官网 (softether-vpnclient-v4.22-9634-beta-2016.11.27-linux-x64-64bit.tar.gz)

		...(略)
		ranlib code/vpnclient.a
		gcc code/vpnclient.a -O2 -fsigned-char -pthread -m64 -lm -ldl -lrt -lpthread -L./ lib/libssl.a lib/libcrypto.a lib/libiconv.a lib/libcharset.a lib/libedit.a lib/libncurses.a lib/libz.a lib/libintelaes.a -o vpnclient
		/usr/bin/ld: code/vpnclient.a(vpnclient.o): relocation R_X86_64_32 against symbol `StopProcess' can not be used when making a shared object; recompile with -fPIC
		/usr/bin/ld: code/vpnclient.a(Unix.o): relocation R_X86_64_32 against `.data' can not be used when making a shared object; recompile with -fPIC
		...(略)
		collect2: error: ld returned 1 exit status
		Makefile:18: recipe for target 'i_read_and_agree_the_license_agreement' failed
		make[1]: *** [i_read_and_agree_the_license_agreement] Error 1
		make[1]: Leaving directory '/opt/vpnclient'
		...(略)

 2. github (#e9006fa)

 		% make
 		cc -DNDEBUG -DVPN_SPEED -DUNIX -DUNIX_LINUX -DCPU_64 -D_REENTRANT -DREENTRANT -D_THREAD_SAFE -D_THREADSAFE -DTHREAD_SAFE -DTHREADSAFE -D_FILE_OFFSET_BITS=64 -I./src/ -I./src/Cedar/ -I./src/Mayaqua/ -O2 -fsigned-char -m64 -c src/Mayaqua/Encrypt.c -o tmp/objs/Mayaqua/Encrypt.o
 		src/Mayaqua/Encrypt.c: In function ‘Enc_tls1_P_hash’:
 		src/Mayaqua/Encrypt.c:175:11: error: storage size of ‘ctx’ isn’t known
 		  HMAC_CTX ctx;
 		...(略)

最后在 [论坛][ref-3] 找到回避方法，

> ha found a woraround 
> instead of installing libssl-dev you have to install libssl1.0-dev
> this way you also install openssl v1.0.x on your debian 9 system.
> 
> it also requires this patch to disable sslv3 support

1. 安装 libssl1.0-dev 替代 libssl-dev
2. 修改代码禁用 sslv3

    ```diff
     src/Mayaqua/Network.c | 2 +-
     1 file changed, 1 insertion(+), 1 deletion(-)
    
    diff --git src/Mayaqua/Network.c src/Mayaqua/Network.c
    index 41d69cc..77a4773 100644
    --- src/Mayaqua/Network.c
    +++ src/Mayaqua/Network.c
    @@ -13013,7 +13013,7 @@ bool StartSSLEx(SOCK *sock, X *x, K *priv, bool client_tls, UINT ssl_timeout, ch
    				}
    				else
    				{
    -                       if (client_tls == false)
    +                       if (true == false)
    						{
    								SSL_CTX_set_ssl_version(ssl_ctx, SSLv3_method());
    						}
    ```


[ref-1]: http://www.softether-download.com
[ref-2]: https://github.com/SoftEtherVPN/SoftEtherVPN
[ref-3]: http://forum.softether.org/viewtopic.php?t=7379&p=19783
