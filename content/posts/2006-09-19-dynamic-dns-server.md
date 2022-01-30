---
categories:
- var
date: "2006-09-19T00:00:00Z"
tags: []
title: dynamic dns server
---
发现 [dnsexit](http://www.dnsexit.com) 比花生壳更方便，因为他的域名动态解析服务是免费的。
在网站上注册过用户后，可以下载客户端定期刷新，下面是安装配置过程

```
[/sun/backup/]sudo dpkg -i ipUpdate-1.5.deb
选中了曾被取消选择的软件包 ipupdate。 
(正在读取数据库 ... 系统当前总共安装有 89764 个文件和目录。)
正在解压缩 ipupdate (从 ipUpdate-1.5.deb) ...
正在设置 ipupdate (1.5) ...



Runinig /usr/sbin/dnsexit-setup.pl...

Wecome in DnsExit.Com Dynamic IP update setup script. 
Please follow instructions to setup our script.

Please type username you have created on <a href="http://www.dnsexit.com">www.dnsexit.com</a> (blank to leave setup):
<--- yourname --->
Please type password for your username: 
<--- password --->
Checking your username and password...
Username and password correct...

Checking your registered domains. This may take a while...

Please select your domains (if you want to select more than 
one domain, please separete them by space):
0 <a href="http://duodes.com">duodes.com</a>
Your selection: 0 
Feching hosts in your domains. This may take a while...
Please select host you want to be updated (if you want to 
select more than one domain, please separete them by space):
0 <a href="http://duodes.com">duodes.com</a>
Your selection: <a href="http://duodes.com">duodes.com</a>
Argument "<a href="http://duodes.com"> duodes.com</a>" isn't numeric in array element at /usr/sbin/dnsexit-setup.pl line 242, <STDIN> line 4.

You have selected following hosts to be updated:
<a href="http://duodes.com">duodes.com</a>

 
Do you want to run it as a daemon?
Your choice [yes]: yes

How often (in minutes) should the program check IP change?
It will only be posted to dnsExit.com when IP address is
changed from the last update. It need to be at least 3 minutes. 
Your choice [10]: 30

Select path to pidfile.
Your choice [/var/run/ipUpdate.pid]: /sun/workspace/ipUpdate.pid
You have selected invalid file name.
Your choice [/var/run/ipUpdate.pid]: /sun/workspace/ipUpdate.pid 
You have selected invalid file name.
Your choice [/var/run/ipUpdate.pid]:

Generating config file...
Done creating config file. You can run the script now.
To do it you can run ipUpdate.pl or use init script. 

File '/tmp/dnsexit-ip.txt' will cache the ip address of
the last successful IP update to our system. For next
update, if the IP stays the same, the update request
won't be sent to our server. You can simply change the 
IP at dnsexit-ip.txt file to force the update to DNSEXIT.

Here are paths to some intresting files:
Pid file: /var/run/ipUpdate.pid
Log file: /var/log/dnsexit.log
Cache file: /tmp/dnsexit-ip.txt

 Don't forget to read README.txt file in doc directory!

```