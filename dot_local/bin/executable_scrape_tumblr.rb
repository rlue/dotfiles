#!/usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

TUMBLR_URL = 'http://j-p-g.tumblr.com'
doc = Nokogiri::HTML(open(TUMBLR_URL))

until (succ = doc.at_css('a.previous')).nil?
  doc.css('div.photo').map do |e|
    e.at_css('> a')&.attributes&.[]('href')&.value
  end.tap do |list|
    File.open('anchor_list.txt', 'a') { |f| f.puts(list) }
  end

  doc.css('div.photo').map do |e|
    e.at_css('img')&.attributes&.[]('src')&.value
  end.tap do |list|
    File.open('image_list.txt', 'a') { |f| f.puts(list) }
  end

  doc = Nokogiri::HTML(open(URI.join(TUMBLR_URL, succ.attributes['href'])))
end
