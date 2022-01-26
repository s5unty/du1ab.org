---
categories:
- var
date: "2008-01-16T00:00:00Z"
tags: []
title: 几个在 docbook 向 html 文件转换过程中影响显示效果的参数
---

<xsl:param name="chunk.first.sections" select="0"></xsl:param><a href="http://picasaweb.google.com/s5unty/VernSBlog/photo#5152633553622833010" target="_blank"></a>
<div class="lhcl_photobox"> <div><div style="overflow: hidden; position: relative; min-width: 512px; height: 208px;"><img src="http://lh6.google.com/s5unty/R4HU6s1yl4I/AAAAAAAAAGc/uwG7rXcmr1g/chunk_first_sections_1.png" style="position: absolute; width: 520px; height: 208px; left: 100px; top: 0px;"> </div></div></div><xsl:param name="chunk.first.sections" select="1"></xsl:param>
<div><div style="overflow: hidden; position: relative; min-width: 512px; height: 275px;"><img src="http://lh6.google.com/s5unty/R4HU6s1yl3I/AAAAAAAAAGU/OOgUfs9DS_k/chunk_first_sections_0.png" style="position: absolute; width: 510px; height: 275px; left: 105px; top: 0px;"> </div></div>&nbsp;
<xsl:param name="chunk.section.depth" select="0"></xsl:param> 
<div><div><div style="overflow: hidden; position: relative; min-width: 512px; height: 279px;"><img src="http://lh3.google.com/s5unty/R4HU681yl5I/AAAAAAAAAGk/GfLJsfoIS4I/chunk_section_depth_0.png" style="position: absolute; width: 511px; height: 279px; left: 105px; top: 0px;"> </div></div> </div>
<xsl:param name="chunk.section.depth" select="1"></xsl:param>
<div><div style="overflow: hidden; position: relative; min-width: 512px; height: 280px;"><img src="http://lh3.google.com/s5unty/R4HU681yl6I/AAAAAAAAAGs/k_LOLFwGIzM/chunk_section_depth_1.png" style="position: absolute; width: 497px; height: 280px; left: 112px; top: 0px;"> </div></div>&nbsp;<span id="edit_caption" class="lhcl_fakelink" onclick="_d('edit_caption')"></span>
<xsl:param name="l10n.gentext.language" select="'zh_cn'"/>
<div><div style="overflow: hidden; position: relative; min-width: 512px; height: 217px;"> <img src="http://lh3.google.com/s5unty/R410y81ynPI/AAAAAAAAAT4/X3H-5pSw_H4/i10n_gentext_language_zh_cn.png" style="position: absolute; width: 517px; height: 217px; left: 102px; top: 0px;"></div></div><xsl:param name=" l10n.gentext.language" select="'en'"/>
<div><div style="overflow: hidden; position: relative; min-width: 512px; height: 225px;"><img src="http://lh3.google.com/s5unty/R410y81ynOI/AAAAAAAAATw/QvOq7b6J3JE/i10n_gentext_language_null.png" style="position: absolute; width: 528px; height: 225px; left: 96px; top: 0px;"> </div></div><xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label  " select="1"/>
<div class="lhcl_photobox"><div><div style="overflow: hidden; position: relative; min-width: 512px; height: 178px;"><img src="http://lh4.google.com/s5unty/R410zM1ynRI/AAAAAAAAAUI/nkWKgzPyfqg/section_autolabel_1__and__section_label_includes_component_label_1.png" style="position: absolute; width: 225px; height: 178px; left: 248px; top: 0px;"> </div></div><div class="lhcl_caption">
<xsl:param name="section.autolabel" select="0"/>
 <xsl:param name="section.label.includes.component.label  " select="0"/>
<span id="edit_caption" class="lhcl_fakelink" onclick="_d('edit_caption')"></span></div></div>
<div class="lhcl_photobox"><div><div class="lhcl_photobox"><div><div class="lhcl_photobox"> <div><div style="text-align: center;"> </div><div style="text-align: left;" class="lhcl_photobox"><div style="overflow: hidden; position: relative; min-width: 512px; height: 178px;"><img src="http://lh4.google.com/s5unty/R410zM1ynQI/AAAAAAAAAUA/i86ojI01bTE/section_autolabel_0__and__section_label_includes_component_label_0.png" style="position: absolute; width: 215px; height: 178px; left: 253px; top: 0px;"> </div></div>  </div></div> </div></div> </div></div>
[1] <a href="http://docbook.sourceforge.net/release/xsl/current/doc/html/chunking.html" target="_blank">http://docbook.sourceforge.net/release/xsl/current/doc/html/chunking.html </a>
[2]  <a href="http://www.parsesoft.net/DocumentFiles/2007/06/17/50cbf664-8057-4918-8346-bb64f638ca8e/ch03s05.html" target="_blank">http://www.parsesoft.net/DocumentFiles/2007/06/17/50cbf664-8057-4918-8346-bb64f638ca8e/ch03s05.html </a>
[3]  <a href="http://www.parsesoft.net/DocumentFiles/2007/06/17/50cbf664-8057-4918-8346-bb64f638ca8e/ch03s02.html#sect.3.2.2.title" target="_blank">http://www.parsesoft.net/DocumentFiles/2007/06/17/50cbf664-8057-4918-8346-bb64f638ca8e/ch03s02.html#sect.3.2.2.title </a>
