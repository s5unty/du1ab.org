---
date: "2007-03-16T00:00:00Z"
tags: b/命令行/4
title: 解决zsh在mlterm下用screen时homeend键功能异常的问题
---

FROM: <http://lfod.us/dotfiles/zshrc>

    # Make HOME and END work reasonably
    case $TERM in
        xterm*)
    	bindkey "^[[F" end-of-line
    	bindkey "^[[H" beginning-of-line 
    	;;
    esac
    
    bindkey '\e[1~' beginning-of-line       # Home
    bindkey '\e[4~' end-of-line             # End
    bindkey '\e[3~' delete-char             # Del
    bindkey '\e[2~' overwrite-mode          # Insert 
    bindkey -v
