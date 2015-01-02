require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require 'json'

doc = Nokogiri::HTML(open("http://www.ldschurchtemples.com/temples/"))

ap links = doc.css("table a")
links = links[1..-1]
co = 1
links.each do |l|
  ap co
  ap l
  co = co + 1
end

# ap links[0]['href'][3..-1]

temple_pages = []

# links.each do |link|
#   temple_pages << Nokogiri::HTML(open("http://www.ldschurchtemples.com/#{link['href'][3..-1]}"))
# end

# ap temple_pages[0]

# File.open('temple_dates.json', "w") {|file| file.write(temple_pages.to_json) }

temple_dates = []

temple_pages = JSON.parse(File.read("temple_dates.json"))

# ap temple_pages

name_pattern = /<h1>(.+)<\/h1>/
milestone_pattern = /milestone">(.+?)<br>/

temple_data = []

temple_pages.each do |temple|
  temple_hash = {}
  temple_hash[temple.scan(name_pattern).join("")] = temple.scan(milestone_pattern)
  temple_data << temple_hash
end


