---
categories:
- var
date: "2012-04-18T00:00:00Z"
tags:
- mail
- textwidth
- vim
- autofmt
title: is there a recommended textwidth for documentation
---

> > Is there any consensus whether you use should a textwidth of 70 or 80
> > or any other value when writing text documents such as README,
> > INSTALL, etc?
> 
> Using 80 is pretty standard.  I use it for code, READMEs, etc.
> However I do push it back to 65 or 70 for emails, just because if
> folks start quoting the email, extra layers of quote-markers
> start making things wider.
> 
> -tim 

[autofmt][1] : text formatting plugin 

    :set runtimepath+='~/.vim/autoload/autofmt/'
    :set formatexpr=autofmt#japanese#formatexpr()

[1]: http://www.vim.org/scripts/script.php?script_id=1939
