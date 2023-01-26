---
date: "2006-09-07T00:00:00Z"
tags: b/编程/6/e
title: "安装svn&apache2&ssl"
---

1. 安装必要的工具
    ```
    # sudo apt-get install \
        apache2 apache2-common apache2-utils libapache2-svn \
        libapache2-mod-auth-pam \
        libapache2-mod-auth-sys-group \
        subversion subversion-tools
    ```
    
2. 配置 ssl 连接
   - 制作 ssl 签名
      ```
      # sudo apache2-ssl-certificate
      # sudo a2enmod ssl
      ```

   - 创建 ssl 文件
     ```
     # sudo cp /etc/apache2/sites-available/default /etc/apache2/sites-available/ssl
     ```
 
   - 修改 default 文件头：
     ```
     NameVirtualHost *:80
     ```
 
   - 修改 ssl 文件头：
     在 ssl 文件<VirtualHost \*:443>里添加：
     ```
     <VirtualHost *:443>
     
     ServerAdmin webmaster@localhost
     SSLEngine on
     SSLCertificateFile /etc/apache2/ssl/apache.pem
     SSLProtocol all
     SSLCipherSuite HIGH:MEDIUM
 
     <Location /svn/pink> # 你将来通过浏览器访问的路径，https://localhost/svn/pink
         DAV svn
         SVNPath /sun/subversion/pink # 你下面将要建立的svn仓库所在的路径
         AuthType Basic
         AuthName "My Subversion Repository"
         AuthUserFile /sun/workspace/.dav_svn.passwd # 你刚才制作的ssl签名的存放路径
         # AuthzSVNAccessFile /etc/apache2/dav_svn.authz # do not open this with ssl
         Require valid-user
     </Location>
     ```
 
   - 在/etc/apache2/sites-enabled/目录创建一个到../sites-availabe 的链接
     ```
     # sudo ln -s /etc/apache2/sites-availabe/ssl ./
     ```
 
   - 在/etc/apache2/ports.conf 文件增加：
     ```
     Listen 443
     ```
 
   - 重新激活虚拟主机
     ```
     # sudo a2ensite ssl
     ```

3. 创建 svn 库
    ```
    # svnadmin create /sun/subversion/pink
    ```

   - 修改权限
     ```
     # sudo chgrp -R src /sun/subversion/pink
     # sudo chmod -R g+w /sun/subversion/pink
     # sudo adduser www-data src
     ```
     
   - 如果不行，只接把权限赋给www-data
 
     ```
     # sudo chown -R www-data /sun/subversion/pink
     # sudo chgrp -R www-data /sun/subversion/pink
     ```
 
   - 打开 apache2 对 svn 的支持
     ```
     #sudo a2enmod dav_svn
     ```

4. 确认 http 无法访问 svn
   修改/etc/apache2/mods-enabled/dav_svn.conf/如：

    ```
    <Location /svn/blogger>
      <LimitExcept GET PROPFIND OPTIONS REPORT>
        Require valid-user
      </LimitExcept>
    </Location>
    ```

5. 重启 apache2 服务
    ```
    # sudo apache2ctl -k restart
    ```

输入 `https://localhost/svn/pink`，看到 Revision 0/ 说明 OK
