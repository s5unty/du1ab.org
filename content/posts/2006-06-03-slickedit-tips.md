---
date: "2006-06-03T00:00:00Z"
tags: b/编辑器/1/a
title: Slickedit tips
---

琢磨出了一点小方法，但是始终想不明白，它怎么能把这些改动集成到软件中去，我觉得这要比插件技术牛比多了！

1.  屏蔽输入'{'时自动补'}'的功能

    修改/macroc/c.e文件，注释`c_begin`()函数的内容，最后增加一行`call_root_key('{')`; 如下：

        _command void c_begin() name_info(','VSARG2_REQUIRES_EDITORCTL|VSARG2_CMDLINE)
        {
            /*
               typeless expand, be_style, indent_fl;
               parse name_info(_edit_window().p_index) with . expand . . be_style indent_fl .;
               int cfg = 0;
               if (!command_state() &&amp; p_col>1) {
               left();cfg=_clex_find(0,'g');right();
               }
                
               if ( command_state() || cfg==CFG_STRING || _in_comment() ||
               c_expand_begin(expand,p_SyntaxIndent,be_style,indent_fl) ) {
               call_root_key('{');
               } else if (_argument=='') {
               _undo('S');
               }
             */
            call_root_key('{'); //sunwa
        }

    通过菜单Macro/Load Module读取c.e文件，即可。

2.  双击buffer tab关闭buf的功能

    编辑bufftabs.e文件，添加以下代码
    
        void ctlsstab1.lbutton_double_click() {
            int tabi = mou_tabid();
            if (tabi < 0) {
                clicked_tabid = -1;
                return;
            }
            clicked_tabid = tabi;
            _str buf_name = list.buffid_order[list.tab_order[clicked_tabid]].buffname;
            _save_non_active(buf_name,1);
            clicked_tabid = -1;
        }

    通过菜单Macro/Load Module读取bufftabs.e文件，即可。

3.  C语言编辑时ENTER(+Ctrl, +Ctrl+Shilf)键定位功能

    indent style选项设置为：Syntax indent 编辑stdcmds.e文件，修改以下代码

        // insert a blank line below the cursor
        // sunwa
        _command insert_blankline_below()
        {
            //insert_line("");
            _end_line();
            c_enter();
        }
        // insert a blank line above the cursor
        // sunwa
        _command insert_blankline_above()
        {
            up();
            _end_line();
            c_enter();
            //insert_line("");
        }

    通过菜单Macro/Load Module读取stdcmds.e文件，即可。
