---
categories:
- var
date: "2008-05-15T00:00:00Z"
tags:
- perl
title: Perl One Liners
---

    % echo "1\n2\n-5" | perl -ne '$n += $_; END { print "$n\n" }'
    % echo "1 3\n2 4\n-5 -3" | perl -ane '$n+=$F[0]; END { print "$n\n" }'
    % echo "1 3\n2 4\n-5 -3" | perl -ane '$n+=$F[1]; END { print "$n\n" }'
