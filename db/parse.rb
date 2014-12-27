require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require 'json'

# doc = Nokogiri::HTML(open("http://www.ldschurchtemples.com/temples/"))

# ap links = doc.css("table a")
# links = links[1..-1]
# co = 1
# links.each do |l|
#   ap co
#   ap l
#   co = co + 1
# end

# # ap links[0]['href'][3..-1]

# temple_pages = []

# links.each do |link|
#   temple_pages << Nokogiri::HTML(open("http://www.ldschurchtemples.com/#{link['href'][3..-1]}"))
# end

# File.open('temple_dates.json', "w") {|file| file.write(temple_pages.to_json) }
# temple_dates = []

# temple_pages.each do |temple|
#   temple.css('milestone')
temple_pages = JSON.parse(File.read("db/temple_dates.json"))


milestone_pattern = /milestone">(.+?)<br>/

temple_data = []
counter = 1
temple_pages.each do |temple|
  temple_data << temple.scan(milestone_pattern)
end

temple_data.each do |temple|
  temple.each do |milestone|
    milestone.each do |wtf|
      wtf.gsub!("</span>", "")
    end
  end
end

# ap temple_data


# Temple.all.each_with_index do |temple, index|
#   temple.announcement = temple_data[index][0][0]
#   temple.save
# end




