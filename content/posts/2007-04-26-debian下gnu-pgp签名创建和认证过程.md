---
date: "2007-04-26T00:00:00Z"
tags: gpg
title: debian下gnu pgp签名创建和认证过程
---

@wingsun: <http://www.blogme.cn/node/3920>

Debian 下使用 PGP 签名的软件很多，一般而言都是使用 GNU PGP 这个软件。

安装：

首先，在安装之前更新一下你的软件包库索引，执行：

    apt-get update

然后开始安装软件:

    apt-get install gnupg

如果无法安装，则必须检查你的 sources.list 编写是否正确，是否包含了指向含有 gnupg 的软件包源，如果没有则请修改它正确。

如果你使用 GUI 环境，你可以安装 gnupg 的图形化前端，在 GNOME 下可以使用 seahorse。

    apt-get install seahorse

你首先需要的是创建一个签名，一个属于你自己的签名。在命令行的模式下执行：

    gpg --gen-key

然后按照提示输入相应的信息就可以了，我建议不要输入 comment 的信息，这样会带来一些麻烦。需要必须输入的信息主要有：full name,comment 和 email，这三个信息就会构成 full name (comment) <email>的格式。一般在制作 debian 软件包的时候我们采用的都是 full name <email>的格式，所以我建议不要输入 comment 的信息。在这一步将会要你输入一个私密的口令，这个口令一定要记住，不能忘掉，否则你的这个 pgp key 就失效了。

生成好你的 key 之后，下一步就是将它发布到互联网上。发布互联网上，首先需要一个 key server，一般安装好后的默认 key server 都是 http://subkeys.pgp.net 。你也可以通过修改 `.gnupg/gpg.conf` 中的 keyserver 信息来改变你的 key server。通过如下命令可以将你的 key 发布到服务器上：

    gpg --send-keys YourKeyID

这将会把你的公匙发布到互联网上。你可以到互联网上的某一个 key server 主页去查询看看你的 key 是否已经发布到服务器上了，也可以通过 gpg --search-keys 来查找你的 Key 是否已经发布到服务器上。

KeyID 可以通过 gpg --list-keys 来获得。以下是一个输出结果：

    pub 1024D/C5852939 2005-02-28
    uid Wing sun <<a href="mailto:chunyang.sun@sw-linux.com">chunyang.sun@sw-linux.com</a>>
    sub 2048g/4782DB2D 2005-02-28

其中 C5852939 就是 Key ID。

这样你就好了一个 Key，接下来你就可以和别人进行 Key sign 了。

key sign 是一个其他人确认且认可你的 Key 是一个可信任的安全 Key 的过程。一般而言在国际上进行 Key sign 的过程是这样的：

1. 你需要向他人提供你的 Key ID、Full Name、Comment、Email 等信息。
2. 提供能证明你的身份的证件，一般而言是身份证、护照等有效证件。
3. 双方交换这些相关的信息，别且详细检查对方的身份证件，并确认该身份证件就是属于对方的，且确认对方提供的信息是正确的，且属于他自己的。
4. 通过 PGP 的软件完成 sign 的过程。

在 Debian 中通过 gnupg 进行操作的过程如下：

首先，在你确认了该 key 的主人身份后，你必须先从互联网上获得该用户的公钥。运行

    gpg --recv-keys KeyID

可以获得相应的用公钥信息到本地，当然你也可以通过 gpg --search-keys 来找寻并获取用户的公钥。

接下来我们就需要对该用户的公钥进行签名，执行

    gpg --sign-key KeyID

gnupg 将会提示你进行用户公钥的签名验证过程，根据提示进行操作即可。

签名完成后，你需要将你签名后的结果重新发送到互联网上，再一次执行：

    gpg --send-keys

将所有的公钥发送到互联网上。

这样你就完成了一个 gpg 签名的过程。

怎样修改一个错误 gpg 密钥？

可能你在创建 gpg 密钥的时候由于不小心输入错误了，而当你发现输入错误的时候，你却已经将该密钥发送出去了。这时候你可以通过

    gpg --edit-key KeyID

来编辑这个密钥，在这个密钥中创建一个新的 User ID(通过 edit-key 的子命令 adduid 来完成)，然后将原有的 User ID 作废掉（先通过 uid 命令选中原有的 User ID，然后通过 revuid 来作废该 User ID），最后将你的修改发送到互联网上的 Key Server 即可。

这儿要注意的是，你做过的任何关于密钥的变更（包括修改、签名、作废等）都需要在最后发送到互联网的 Key Server 才可以确保它完全的生效。

备份你的密钥或者将密钥从一台计算机转移到另外一台

备份密钥分为备份公钥和私钥两个部分，备份公钥：

    gpg -o keyfilename --export KeyID

如果没有 KeyID 则是备份所有的公钥，-o 表示输出到文件 keyfilename 中，如果加上-a 的参数则输出文本格式的信息，否则输出的是二进制格式信息。

备份私钥：

    gpg -o keyfilename --export-secret-keys KeyID

如果没有 KeyID 则是备份所有的私钥，-o 表示输出到文件 keyfilename 中，如果加上-a 的参数则输出文本格式的信息，否则输出的是二进制格式信息。

然后在别的机器上可以通过

    gpg --import filename

导入这些信息。

如果你使用的是相同的系统，则你可以通过最简单的方法将 gpg 的所有信息拷贝到另外一台计算机上。也就是说你只需要把.gnupg 目录完全拷贝到你要拷贝的机器上即可。

如果你丢失了你的私钥，那么你就失去了对该密钥的控制权，因此请保护好你的私钥，将其存储于一个安全的场所。

暂时到此，中午写了一半，要开会只好中断了。
