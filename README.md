# This is the data for my homepage and blog #

It's automatically transformed by [Jekyll](http://github.com/mojombo/jekyll)
into a static site whenever I push this repository to GitHub.
based on [alip.github.com](https://github.com/alip/alip.github.com)

    #!/bin/sh
    #
    # 把该脚本放在服务器 /sun/blog/_post/.git/hooks/ 目录，发布 blog:
    # vern@somewhere$ git clone du1abadd.org:/sun/blog/_posts myblog
    # vern@somewhere$ cd myblog; blabla <-- 编辑 blog
    # vern@somewhere$ git ci -a -m "提交 blog"
    # vern@somewhere$ git push
    # ...
    # ...
    # remote: Successfully generated site: . -> site
    # remote: ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    # To du1abadd.org:/sun/blog/_posts
    #    ef3b892..c999bc8  HEAD -> master
    #
    #
    
    # /sun/blog/_posts/.git，此时目录在 _posts/.git/
    # cd to _posts/
    cd ..
    
    # 由于这里并非是单纯的仓库，本地会保留原始内容
    # 在远端更新上来后，这里 RESET 会取消本地保留的内容
    env -i git reset HEAD
    
    # 这里的 CHECKOUT 会同步远端更新上来的内容
    env -i git checkout .
    
    # 到此为止，远端内容同步成功，日志也保持和远端相同
    # cd to blog/
    cd ..
    
    # 重新生成 tags 页面
    make clean
    make
    
    # 执行发布程序
    /var/lib/gems/1.8/bin/jekyll . site
    
    # tweets 只能在首页发布后重新生成
    env -i _scripts/tweets.py
    
    # 通知远端，blog/ 发布成功
    if [ $? -eq 0 ]; then
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    else
        echo "!! Blog update failed !!"
    fi

<!-- vim: set tw=80 ft=mkd spell spelllang=en sw=4 sts=4 et : -->
