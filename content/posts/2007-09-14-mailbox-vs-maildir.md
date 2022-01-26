---
categories:
- var
date: "2007-09-14T00:00:00Z"
tags: []
title: mailbox vs maildir
---

FROM: <a href="http://vampiroz.org/2007/05/mutt-mailbox-vs-maildir.html">http://vampiroz.org/2007/05/mutt-mailbox-vs-maildir.html</a>

Are you using <a href="http://www.mutt.org/">Mutt</a> and wondering whether it's better to use  <a href="http://en.wikipedia.org/wiki/Mbox">mbox</a> (mailbox) or <a href="http://vampiroz.org/2007/05/mutt-mailbox-vs-maildir.html">maildir</a> for mail storage?. I hope this post will help you decide. p. Here I publish a simple benchmark results of the time it takes mutt to read/open a folder with 28.000 emails. 

 p. First, some notes about the tests:

 <ul><li>software: mutt 1.5.13 compiled with +USE_HCACHE running on a Debian 4.0 server (2.6.18 kernel)</li><li>hardware: 3.2 Ghz Pentium 4 with 2Gb of RAM</li><li>all this values are averages</li><li>all these tests are taken with disk buffers active on RAM </li><li>all numbers are averages times</li></ul> p. Now, the results…

  h3. Using mbox


 <pre>@real    0m1.920s
user    0m1.808s
sys     0m0.112s
@</pre> h3. Using maildir without header_cache


 <pre>@real    0m2.599s
user    0m2.092s
sys     0m0.508s
@</pre> h3. Using maildir with header_cache


 <pre>@real    0m0.884s
user    0m0.732s
sys     0m0.152s
@</pre> h3. Conclusion

 p. Based on these results, it seems the better choice is to use maildir with header_cache (BTW, header_cache doesn't work with mbox). However, this benchmarks are quite simple and don't cover all the facts so I recommend you to run the following tests before you decide:

 <ul><li>This same tests with disk buffers out of RAM (use __echo 3 /proc/sys/vm/drop_caches__ to invalidate disk buffers)</li><li>Using folders bigger than the available RAM</li><li>Taking some measures on body search times </li></ul>
