#!/usr/bin/env ruby
# coding: utf-8
# vim: set sw=2 sts=2 et nowrap fenc=utf-8 :
# Copyright 2010 Ali Polatel <alip@exherbo.org>
# Distributed under the terms of the GNU General Public License v2

%w{fileutils rubygems jekyll}.each {|m| require m}

$: << File.expand_path(File.dirname(__FILE__))
require 'utils'

include FileUtils

options = Jekyll.configuration({})
options['lsi'] = false

site = Jekyll::Site.new(options)
site.read_posts('')

sorted_tags = site.tags.sort {|a, b| b[1].length <=> a[1].length}

mkdir_p(options['tags_directory'])
File.open(File.join(options['tags_directory'], "index.html"), "w") do |f|
  f.puts "---"
  f.puts "layout: default"
  f.puts "title: Tags"
  f.puts "---"
  f.puts

  sorted_tags.each do |tag, posts|
    sorted_posts = posts.sort {|a, b| b.date <=> a.date }

    f.puts "<h3 id=\"#{sanitize_tag(tag)}\">Tag: #{tag}</h3>"
    f.puts "<ul class=\"post\">"
    sorted_posts.each do |post|
      f.puts "<li><a href='#{post.url}'><span>#{post.date.strftime('%Y-%m-%d')}</span> &raquo; #{post.data['title']}</a></li>"
    end
    f.puts "</ul>"
  end
end
