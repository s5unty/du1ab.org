#!/usr/bin/env ruby
# coding: utf-8
# vim: set sw=2 sts=2 et nowrap fenc=utf-8 :

%w{rubygems active_support}.each {|m| require m}

module Slugalizer
  extend self

  SEPARATORS = %w[- _ +]

  def slugalize(text, separator = "-")
    unless SEPARATORS.include?(separator)
      raise "Word separator must be one of #{SEPARATORS}"
    end
    re_separator = Regexp.escape(separator)
    result = decompose(text.to_s)
    # support CJK charactar/word
    #result.gsub!(/[^\x00-\x7F]+/, '') # Remove non-ASCII (e.g. diacritics).
    #result.gsub!(/[^a-z0-9\-_\+]+/i, separator) # Turn non-slug chars into the separator.
    result.gsub!(/#{re_separator}{2,}/, separator) # No more than one of the separator in a row.
    result.gsub!(/^#{re_separator}|#{re_separator}$/, '') # Remove leading/trailing separator.
    result.downcase!
    result
  end

private
  def decompose(text)
    if defined?(ActiveSupport::Multibyte::Handlers) # Active Support <2.2
      ActiveSupport::Multibyte::Handlers::UTF8Handler.normalize(text, :kd).to_s
    else # ActiveSupport 2.2+
      ActiveSupport::Multibyte::Chars.new(text).normalize(:kd).to_s
    end
  end
end

def sanitize_tag(tag)
  Slugalizer::slugalize(tag)
end
