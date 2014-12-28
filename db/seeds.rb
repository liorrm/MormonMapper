# require 'awesome_print'
# require 'json'
# require_relative 'parse'

temple_data = JSON.parse(File.read("db/database.json"), symbolize_names: true)

temple_data.each do |temple|
  Temple.create(temple)
end

# temple_pages = JSON.parse(File.read("db/temple_dates.json"))


# milestone_pattern = /milestone">(.+?)<br>/

# temple_data = []
# counter = 1
# temple_pages.each do |temple|
#   temple_data << temple.scan(milestone_pattern)
# end

# temple_data.each do |temple|
#   temple.each do |milestone|
#     milestone.each do |wtf|
#       wtf.gsub!("</span>", "")
#     end
#   end
# end



#### Script for creating a json copy of database ####
# File.open('database.json', 'w') do |file|
#   file.puts Temple.all.order(id: :asc).to_json
# end
#######################################################

# ap temple_data


# Temple.all.each_with_index do |temple, index|
#   temple.announcement = temple_data[index][0][0]
#   temple.save
# end


# Temple.all.each do |temple|
#   puts "#{temple.id}. #{temple.name}. Announcement: #{temple.announcement}"
# end
