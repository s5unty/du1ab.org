---
date: "2007-03-06T00:00:00Z"
tags: os/debian
title: video=vesa:option[,options]
---

FROM: <http://lists.debian.org/debian-user-spanish/2003/12/msg00433.html>

> Accepted options:
> 
> invers	no comment...
> 
> ypan	enable display panning using the VESA protected mode  
> 	interface.  The visible screen is just a window of the
> 	video memory, console scrolling is done by changing the
> 	start of the window.
> 	pro:	* scrolling (fullscreen) is fast, because there is
> 		  no need to copy around data. 
> 		* You'll get scrollback (the Shift-PgUp thing),
> 		  the video memory can be used as scrollback buffer
> 	kontra: * scrolling only parts of the screen causes some
> 		  ugly flicker effects (boot logo flickers for 
> 		  example).
> 
> ywrap	Same as ypan, but assumes your gfx board can wrap-around 
> 	the video memory (i.e. starts reading from top if it
> 	reaches the end of video memory).  Faster than ypan.
> 
> redraw	scroll by redrawing the affected part of the screen, this 
> 	is the safe (and slow) default.
> 
> vgapal	Use the standard vga registers for palette changes.
> 	This is the default.
> pmipal	Use the protected mode interface for palette changes.
> 
> mtrr	setup memory type range registers for the vesafb framebuffer. 
> 
> vram:n  remap 'n' MiB of video RAM. If 0 or not specified, remap memory
>         according to video mode. (2.5.66 patch/idea by Antonino Daplas
> 	reversed to give override possibility (allocate more fb memory 
> 	than the kernel would) to 2.4 by [tmb@iki.fi](mailto:tmb@iki.fi))
