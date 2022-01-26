---
categories:
- var
date: "2007-07-19T00:00:00Z"
tags: []
title: Load a background image in a Gtk Window
---

FROM: <http://www.gtkforums.com/about446.html>

For completeness heres a copy of the routine I used to create windows with a background image... 
  
You probably need to customise it a little, Im working on an embedded device that supports only 640x480. 
 
~~~c
GtkWidget *SetupWindow(gchar *data,gboolean Transient) {
GdkPixmap *background;
GdkPixbuf *pixbuf;
GdkScreen *ourscreen;
GdkColormap *colormap;
GtkStyle *style;
GdkColor fg; 
GdkColor bg;
GError *error = NULL;
GdkRectangle *rect;
GtkWidget *window;

pixbuf = gdk_pixbuf_new_from_file ("pics/fb.png",&error);
if (error != NULL) {
    if (error->domain == GDK_PIXBUF_ERROR) { 
        g_print ("Pixbuf Related Error:\n");
    }
    if (error->domain == G_FILE_ERROR) {
        g_print ("File Error: Check file permissions and state:\n");
    } 
    g_printerr ("%s\n", error[0].message);
    exit(1);
}

gdk_pixbuf_render_pixmap_and_mask (pixbuf, &background, NULL, 0);
style = gtk_style_new ();
style->bg_pixmap[0] = background; 
window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
gtk_window_set_title (GTK_WINDOW (window), data);
// gtk_window_maximize(GTK_WINDOW(window));
gtk_window_set_modal (GTK_WINDOW (window),TRUE);
 gtk_window_set_default_size(GTK_WINDOW(window),640,480);
gtk_widget_set_style (GTK_WIDGET(window), GTK_STYLE(style));
gtk_window_set_position(GTK_WINDOW(window),GTK_WIN_POS_CENTER_ALWAYS);
gtk_container_set_border_width(GTK_CONTAINER(window), 14); 
if(Transient==TRUE)
gtk_window_set_transient_for(GTK_WINDOW (window),GTK_WINDOW(mainwindow));
gtk_widget_show (window);
return(window);
}
~~~
