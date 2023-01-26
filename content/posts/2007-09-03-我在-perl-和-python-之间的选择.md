---
date: "2007-09-03T00:00:00Z"
tags: [b/编程/5, b/脚本/3/a]
title: 我在 perl 和 python 之间的选择
---

几天前在粗略对比了 Perl, Python, Ruby 之后，我毅然决然的投入到 Perl 的阵营。
 
1. 历史
   Perl 1.0 版是在1987年，Python 比 Perl 迟到了2年，Ruby 大概是在 1993 年一般来说历史越悠久，沉积的文化越丰富。\
    虽然如此，但我用的编辑器却不是 Emacs(1970)，而是 Vim(1991) 和 SlickEdit(1988) 。
 
2. 通用性
   Debian 集成了 Perl，没有集成 Python 和 Ruby

        find /usr/bin -exec file {} \; | grep perl | wc -l          >> 200 
        find /usr/bin -exec file {} \; | grep python | wc -l        <<  30
        find /usr/bin -exec file {} \; | grep ruby | wc -l          << 10
 
3. 代码版面

        sub perl {
            print "hi";
        } # 习惯
        
        def python():
            print "hi";
            # 不习惯
        
        def ruby()
            puts "hi"
        end # 习惯
 
4. 未来
   据不准确消息

   * Python 3.0 会完全地破坏向后兼容性
   * Perl 6 还全面向下兼容 Perl 5 的代码
 
最后在我以迷茫的表情分别阅读了 Python 3.0 和 Perl 6 的部分新特性之后，我毅然决然的投入到了 Perl 的阵营。</div>
