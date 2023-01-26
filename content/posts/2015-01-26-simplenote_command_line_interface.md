---
date: "2015-01-26T00:00:00Z"
tags: b/文档/11
title: Simplenote Command Line Interface
---

When edit the file which content has "UTF-8" charset, something wrong:

```python
...
  File "/usr/local/lib/python2.7/dist-packages/urwid/main_loop.py", line 499, in process_input
    k = self._topmost_widget.keypress(self.screen_size, k)
  File "/usr/local/lib/python2.7/dist-packages/simplenote_cli/sncli.py", line 615, in gui_frame_keypress
    content = self.exec_cmd_on_note(note)
  File "/usr/local/lib/python2.7/dist-packages/simplenote_cli/sncli.py", line 81, in exec_cmd_on_note
    tf = temp.tempfile_create(note if note else None, raw=raw)
  File "/usr/local/lib/python2.7/dist-packages/simplenote_cli/temp.py", line 21, in tempfile_create
    tf.write(note['content'])
UnicodeEncodeError: 'ascii' codec can't encode characters in position 4-5: ordinal not in range(128)
```

I did a quick patch for myself.
Without much more testing.
Hope it will works well for other guys ;)

```diff
 simplenote_cli/sncli.py |    8 ++++----
 simplenote_cli/temp.py  |    4 ++--
 2 个文件被修改，插入 6 行(+)，删除 6 行(-)

diff --git simplenote_cli/sncli.py simplenote_cli/sncli.py
index 0e76a91..bcac3db 100644
--- simplenote_cli/sncli.py
+++ simplenote_cli/sncli.py
@@ -623,8 +623,8 @@ class sncli:
             if not content:
                 return None
 
-            md5_old = md5.new(note['content']).digest()
-            md5_new = md5.new(content).digest()
+            md5_old = md5.new(note['content'].encode("utf-8")).digest()
+            md5_new = md5.new(content.encode("utf-8")).digest()
 
             if md5_old != md5_new:
                 self.log(u'Note updated')
@@ -1030,8 +1030,8 @@ class sncli:
         if not content:
             return
 
-        md5_old = md5.new(note['content']).digest()
-        md5_new = md5.new(content).digest()
+        md5_old = md5.new(note['content'].encode("utf-8")).digest()
+        md5_new = md5.new(content.encode("utf-8")).digest()
 
         if md5_old != md5_new:
             self.log(u'Note updated')
diff --git simplenote_cli/temp.py simplenote_cli/temp.py
index 46de9c2..f81968f 100644
--- simplenote_cli/temp.py
+++ simplenote_cli/temp.py
@@ -18,7 +18,7 @@ def tempfile_create(note, raw=False):
             ext = '.mkd'
         tf = tempfile.NamedTemporaryFile(suffix=ext, delete=False)
         if note:
-            tf.write(note['content'])
+            tf.write(note['content'].encode("utf-8"))
         tf.flush()
     return tf
 
@@ -35,6 +35,6 @@ def tempfile_content(tf):
     tf.seek(0)
     lines = []
     for line in tf:
-        lines.append(line)
+        lines.append(line.decode("utf-8"))
     return lines
 
```
