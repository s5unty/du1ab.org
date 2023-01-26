---
date: "2008-05-30T00:00:00Z"
tags: b/邮件/2/a
title: custom date header in mutt
---

origin
: `Date: Tue, 31 Oct 2006 20:24:16 -0600 (CST)`
custom
: `X-LDate: Wed, 2006-11-01 10:24 +0800 | Tue, 20:24 -0600`

Insert the code below into ~/.procmailrc

    :0
    * ^Date: \/.*
    {
        date = `echo "$MATCH" | grep -E -o '^[^\(+-]*'`
        zone = `echo "$MATCH" | grep -E -o '[\(+-].*$'`
        org_date = `date +'%a, %R' -d "$date"`
        loc_date = `date +'%a, %F %R %z' -d "$MATCH"`
        :0 fhw
        | $FORMAIL -I "X-LDate: ${loc_date} | ${org_date} ${zone}"
    }

Update the muttrc or other configuration file which is used to configure the
header displayed in the mutt:

    ignore *
    unignore From:
    unignore To:
    unignore CC:
    unignore BCC:
    unignore X-LDate:
    unignore Reply-To:
    unignore Organization:
    unignore Subject:p. hdr_order From: To: CC: BCC: Reply-To: Organization: X-LDate: Subject:
