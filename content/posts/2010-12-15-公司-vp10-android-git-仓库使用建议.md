---
date: "2010-12-15T00:00:00Z"
tags: b/编程/6/d
title: 公司 vp10-android.git 仓库使用建议
---

初始化(clone & checkout -b)
---------------------------
大家首次 clone 了仓库后默认处于 master 分支，**建议** 大家立即在本地新建一个以
自己 ``名.姓`` 命名的分支，作为日常提交的、保存/备份在服务器端的工作目录。姓名
分支在本地建立成功后，应该立即 ``git checkout 名.姓`` 切换到该分支进行工作，然
而该姓名分支并不会在服务器端自动创建，需要我们执行一条命令。总的来说流程应该像
这样:

    1% cd /tmp/
    2% git clone git@192.168.1.3:vp10-android-2.1_r2 vp10-android
    3% cd vp10-android
    4% git checkout -b wuan.sun
    5% git push origin wuan.sun

切换到你的工作目录1)，首次下载仓库2)，进入仓库3)，建立自己的姓名分支4)，在服务
器端同步创建姓名分支5)

推送工作(pull & push)
---------------------
大家在各自的姓名分支工作一段时间后，自己觉得自己所做的修改相对稳定成熟了，或者
其他人正在等待你最近的某项修改，这时你应该负责把自己姓名分支的内容安全的、干净
的、及时的推送到服务器端的 master 分支。**建议** 使用汉语描述 master 分支的合并
/提交/修改日志。总的来说流程应该像这样:

    0% git branch
      master
    * wuan.sun
    1% ... work work work ...
    2% git commit -a -m "have done"
    3% git push origin wuan.sun
    4% git checkout master
    5% git pull origin master
    6% git pull . wuan.sun
    7% git push origin master
    8% git checkout wuan.sun

在自己姓名分支里日常开发1,2,3)。发布自己的工作之前，切换到 master 分支4)，并且
同步到最新状态5)。接着把自己姓名分支的内容拉入 master 分支6)，解决这里很可能存
在的合并冲突问题。发布自己的工作7)，切换回姓名分支继续工作8)。

合并冲突(status & mergetool)
----------------------------
假设情景，huliang 在自己的姓名分支 liang.hu 做了两次提交，分别是 "1" 和 "2"，
sunwuan 也在自己的姓名分支做了两次提交，也是 "1" 和 "2"，不幸的是 huliang 在发
布自己的工作时发现和 sunwuan **已经**发布的内容在 master 分支上产生了冲突。大致
过程记录如下:

    0% git branch
      master
    * liang.hu
    1% git checkout master
    2% git pull origin master
    From /tmp/test
     * branch            master     -> FETCH_HEAD
    Updating b774105..e451157
    Fast-forward
     foo |    2 ++
     1 files changed, 2 insertions(+), 0 deletions(-)
    3% git pull . liang.hu
    From .
     * branch            liang.hu   -> FETCH_HEAD
    Auto-merging foo
    CONFLICT (content): Merge conflict in foo
    Automatic merge failed; fix conflicts and then commit the result.
    4% git status
    UU foo
    5% git mergetool
    Merging the files: foo

    Normal merge conflict for 'foo':
      {local}: modified
      {remote}: modified
    Hit return to start merge resolution tool (persistent): 
    6% git status
    M  foo
    7% git add foo
    8% git commit -am "3"
    9% git log --pretty=format:'%h %cn %m %s %cr %d' --branches --graph --since='1 months ago'
    *   b4c402c Vern Sun > 3        1 seconds ago  (HEAD, master)
    |\  
    | * da3c05f Vern Sun > 2        16 minutes ago  (origin/liang.hu, liang.hu)
    | * af4eb8c Vern Sun > 1        18 minutes ago 
    * | e451157 Vern Sun > 2        19 minutes ago  (origin/wuan.sun, origin/master, origin/HEAD)
    * | 894782d Vern Sun > 1        19 minutes ago 
    |/  
    * b774105 Vern Sun > initialize 21 minutes ago 
    10% git push origin master
    Counting objects: 7, done.
    Unpacking objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 288 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To /tmp/test.git
       e451157..b4c402c  master -> master
    11% git log --pretty=format:'%h %cn %m %s %cr %d' --branches --graph --since='1 months ago'
    *   b4c402c Vern Sun > 3        2 minutes ago  (HEAD, origin/master, origin/HEAD, master)
    |\  
    | * da3c05f Vern Sun > 2        18 minutes ago  (origin/liang.hu, liang.hu)
    | * af4eb8c Vern Sun > 1        20 minutes ago 
    * | e451157 Vern Sun > 2        21 minutes ago  (origin/wuan.sun)
    * | 894782d Vern Sun > 1        21 minutes ago 
    |/  
    * b774105 Vern Sun > initialize 22 minutes ago 

huliang 在自己的姓名分支上工作0)，发布自己工作前要切换到 master 分支1)，然后向
服务器端同步最新内容2)。当他准备向 master 拉入自己姓名分支中的工作内容时3)发生
了冲突，他检查了当前状态4)发现名为 foo 的文件存在冲突，使用 mergetool 命令启动
3 方合并工具5)并在工具的帮助下艰难的解决了问题，接着继续检查其他存在合并冲突的
文件6)，发现所有存在合并冲突的文件都已解决，他开始手工提交本次修改7,8)，一切准
备就绪后他向服务器端推送了自己最新的修改10)。

![冲突解决前的 foo 文件截图][conflict.png]
![解决后的截图][solved.png]

不同的 3 方合并工具所见的效果不同，git 推荐 kdiff3, meld。更多信息 ``man git
mergetool``

重定向(stash & rebase)
----------------------
大家在各自的姓名分支工作，期间也许因为觉得不够稳定成熟，也许因为其他原因，还没
有向 master 分支回推过任何内容。这种情况下，当你收到 master 分支变更的邮件通知
后，**建议**你立即开始重定向你的姓名分支。

重申: **建议**你始终关注 master 分支的变更，并及早开始重定向工作。否则你现在所
修改的这一行代码，很可能在一分钟前已经被其他人删除了。

    0% git branch
      master
    * wuan.sun
    1% git stash save
    2% git checkout master
    3% git pull origin master
    4% git checkout wuan.sun
    5% git rebase master
    6% git stash pop

在姓名分支工作时0)，收到 master 变更的邮件通知。暂时保存当前工作目录的内容1)，
准备更新 master 分支2)，同步到最新的 master 内容后3)，切换回姓名分支4)，执行重
定向操作5)，回复之前保存的内容6)。解决这里可能会产生的合并冲突问题。

重定向前例图:

         A---B---C  wuan.sun
        /
    D---E---F---G  master

重定向后例图:

                 A'--B'--C'  wuan.sun
                /
    D---E---F---G  master

压缩合并(--squash)
------------------
发布自己的工作前:

                 E---F---G  liang.hu
                /
    ... ---A---B---C---D  master
            \
             H---I---J  wuan.sun

发布自己的工作后:

                 E---F---G  liang.hu
                /
    ... ---A---B---C---D---H---I---J  master, wuan.sun

结果是 wuan.sun 分支做的三次提交 H, I, J 现在已经合并到 master 分支，在 master
分支的日志中可以看到 H, I, J 三次提交的日志。有时候你可能会希望在 master 中只显
示一次提交，也许是因为其中一次提交的日志不够清晰，也许是因为其他原因，总之你希
望将 wuan.sun 分支合并到 master 分支中的三次提交**压缩**为一次提交，可以这样作:

    1% git checkout master
    2% git pull origin master
    3% git pull --squash . wuan.sun
    4% git commit -a -m "一次压缩提交，我编号 K"
    5% git push origin master
    6% git checkout wuan.sun

准备发布自己的工作前，切换到 master 分支并更新到最新状态1,2)。从 wuan.sun 分支
拉入所有修改3)，但暂未提交。手工提交并编辑日志信息4)。推送到服务器端 master 分
支5)，切换回姓名分支继续工作7)。

压缩合并后:

                 E---F---G  liang.hu
                /
    ... ---A---B---C---D---K  master, wuan.sun

版本发布(tag & archive)
-----------------------
master 是相对稳定但未经过测试的版本，**不建议**直接作为发布版本，只作内部测试用
的基础版本，


工作在 Shell
------------
**建议**大家修改各自的 Shell 提示符，使之能显示所在 git 仓库的当前分支。添加以
下内容到 ~/.bashrc:

```bash
find_git_branch () {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head = ref:\ refs/heads/* ]]; then
                git_branch=" | ${head#*/*/}"
            elif [[ $head != '' ]]; then
                git_branch=" | (detached)"
            else
                git_branch=" | (unknow)"
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
PS1="[\u@\h:\w\$git_branch]\$ "
```

[conflict.png]: https://blog.du1ab.org/2010/12/conflict.png "冲突"
[solved.png]: https://blog.du1ab.org/2010/12/solved.png     "解决"
