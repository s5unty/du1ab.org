---
date: "2007-09-14T00:00:00Z"
tags: mutt/邮件
title: mailbox vs maildir
---

FROM: http://vampiroz.org/2007/05/mutt-mailbox-vs-maildir.html

Are you using [Mutt](http://www.mutt.org/) and wondering whether it's better to use  [mbox](http://en.wikipedia.org/wiki/Mbox) (mailbox) or [maildir](http://vampiroz.org/2007/05/mutt-mailbox-vs-maildir.html) for mail storage?. I hope this post will help you decide. p. Here I publish a simple benchmark results of the time it takes mutt to read/open a folder with 28.000 emails. 

First, some notes about the tests:

-   software: mutt 1.5.13 compiled with +USE_HCACHE running on a Debian 4.0 server (2.6.18 kernel)
-   hardware: 3.2 Ghz Pentium 4 with 2Gb of RAM
-   all this values are averages
-   all these tests are taken with disk buffers active on RAM
-   all numbers are averages times

## Using mbox
```
real    0m1.920s
user    0m1.808s
sys     0m0.112s
```

## Using maildir without header_cache
```
real    0m2.599s
user    0m2.092s
sys     0m0.508s
```

## Using maildir with header_cache
```
real    0m0.884s
user    0m0.732s
sys     0m0.152s
```

## Conclusion

Based on these results, it seems the better choice is to use maildir with header_cache (BTW, header_cache doesn't work with mbox). However, this benchmarks are quite simple and don't cover all the facts so I recommend you to run the following tests before you decide:

-   This same tests with disk buffers out of RAM (use __echo 3 /proc/sys/vm/drop_caches__ to invalidate disk buffers)
-   Using folders bigger than the available RAM
-   Taking some measures on body search times
