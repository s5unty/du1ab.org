#!/usr/bin/env ruby
# coding: utf-8
# vim: set sw=2 sts=2 et nowrap fenc=utf-8 :
# Copyright 2010 Ali Polatel <alip@exherbo.org>
# Based in part upon generate_cloud.py by Jack Moffitt
# Distributed under the terms of the GNU General Public License v2

%w{rubygems jekyll}.each {|m| require m}

$: << File.expand_path(File.dirname(__FILE__))
require 'utils'

options = Jekyll.configuration({})
options['lsi'] = false

site = Jekyll::Site.new(options)
site.read_posts('')

sorted = site.tags.sort {|a, b| b[1].length <=> a[1].length}
factor = 1
max_count = sorted[0][1].length
min_count = sorted[-1][1].length

if max_count == min_count
  min_count -= options['cloud_max_ranks']
else
  factor = (options['cloud_max_ranks'] - 1) / Math.log(max_count - min_count + 1)
end

if sorted.length < options['cloud_max_ranks']
  factor *= sorted.length / options['cloud_max_ranks'].to_f
end

open(options['cloud_html'], 'w') do |f|
  f.puts "<ul>"
  for index in (0..options['cloud_size']).to_a.shuffle do
    if sorted[index].nil? then next end
    rank = options['cloud_max_ranks'] - (Math.log(sorted[index][1].length - min_count + 1) * factor).to_i
    f.puts ' ' * 4 + "<li class='cloud-rank-#{rank}'>"
    f.puts ' ' * 8 + "<a href='/tags/\##{sanitize_tag(sorted[index][0])}'>#{sorted[index][0]}</a>"
    f.puts ' ' * 8 + "<!-- count: #{sorted[index][1].length} -->"
    f.puts ' ' * 4 + '</li>'
  end
  f.puts '</ul>'
end
