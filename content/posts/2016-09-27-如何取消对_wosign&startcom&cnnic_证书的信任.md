---
date: "2016-09-27T00:00:00Z"
tags: 
title: 如何取消对 WoSign&StartCom&CNNIC 证书的信任
---

```diff
% diff /etc/ca-certificates.conf.orig /etc/ca-certificates.conf
48c48
< mozilla/CNNIC_ROOT.crt
---
> #mozilla/CNNIC_ROOT.crt
134,136c134,136
< mozilla/StartCom_Certification_Authority_2.crt
< mozilla/StartCom_Certification_Authority.crt
< mozilla/StartCom_Certification_Authority_G2.crt
---
> #mozilla/StartCom_Certification_Authority_2.crt
> #mozilla/StartCom_Certification_Authority.crt
> #mozilla/StartCom_Certification_Authority_G2.crt
181,182c181,182
< mozilla/WoSign_China.crt
< mozilla/WoSign.crt
---
> #mozilla/WoSign_China.crt
> #mozilla/WoSign.crt
185,186c185,186
< mozilla/CA_WoSign_ECC_Root.crt
< mozilla/Certification_Authority_of_WoSign_G2.crt
---
> #mozilla/CA_WoSign_ECC_Root.crt
> #mozilla/Certification_Authority_of_WoSign_G2.crt
% sudo update-ca-certificates
```
