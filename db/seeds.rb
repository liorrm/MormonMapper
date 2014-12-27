require 'awesome_print'
require 'json'
require_relative 'parse'

temple_data = JSON.parse(File.read("db/database.json"), symbolize_names: true)

# temple_data.each do |temple|
#   Temple.create(temple)
# end

Temple.all.each do |temple|
  puts "#{temple.id}. #{temple.name}: #{temple.address}"
  puts ""
  puts ""
  puts " "
  # if temple.address[-2] == "•"
  #   temple.address = temple.address[0..-3]
  # end
end

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


# Temple.all.each do |temple|
#   puts "#{temple.id}. #{temple.name}. Announcement: #{temple.announcement}"
# end
