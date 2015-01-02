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



# ### Script for creating a json copy of database ####
# File.open('database.json', 'w') do |file|
#   file.puts Temple.all.order(id: :asc).to_json
# end
# ######################################################



# Temple.all.each_with_index do |temple, index|
#   temple.announcement = temple_data[index][0][0]
#   temple.save
# end


# Temple.all.each do |temple|
#   puts "#{temple.id}. #{temple.name}. Announcement: #{temple.announcement}"
# end

# require 'nokogiri'
# require 'open-uri'
# require 'awesome_print'
# require 'json'

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

# # links.each do |link|
# #   temple_pages << Nokogiri::HTML(open("http://www.ldschurchtemples.com/#{link['href'][3..-1]}"))
# # end

# # ap temple_pages[0]

# # File.open('temple_dates.json', "w") {|file| file.write(temple_pages.to_json) }

# temple_dates = []

# temple_pages = JSON.parse(File.read("db/temple_dates.json"))

# # ap temple_pages

# name_pattern = /<h1>(.+)<\/h1>/
# milestone_pattern = /milestone">(.+?)<br>/

# temple_data = []

# temple_pages.each do |temple|
#   temple_info = []
#   temple_info << temple.scan(name_pattern).join("")

#   temple.scan(milestone_pattern).each do |milestone|
#     temple_info << milestone.join("")
#   end
#   temple_data << temple_info
# end


# temple_data.each do |temple|
#   temple.each do |attribute|
#     attribute.gsub!("</span>", "")
#   end
# end

# ap temple_data


# errors = []

# temple_data.each do |temple|
#   temple_to_modify = Temple.where(name: temple[0]).first
#   if temple_to_modify
#     temple_to_modify.announcement = temple[1]
#     temple_to_modify.save
#     puts "the following temple was modified:"
#     puts ""
#     puts temple_to_modify.name
#     puts ""
#     puts ""
#   else
#     errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end



#   ap Temple.where(name: temple)
# temple_data.map! do |temple_hash|
#   temple_hash.flatten!
# end
#   temple_hash.map do |attribute_array|
#     attribute_array = attribute_array.flatten!
#   end
# end

# ap temple_data


# Temple.all.each_with_index do |temple, index|
#   temple.announcement = temple_data[index][0][0]
#   temple.save
# end

# no_temple_errors = []
# no_info_on_temple_errors = []

# temple_data.each do |temple|
#   temple_to_modify = Temple.where(name: temple[0]).first
#   if temple_to_modify
#     if temple.length > 2
#       temple_to_modify.groundbreaking = temple[2]
#       temple_to_modify.save
#       puts "the following temple was modified:"
#       puts ""
#       puts temple_to_modify.name
#       puts ""
#       puts ""
#     else
#       no_info_on_temple_errors << temple[0]
#     end
#   else
#     no_temple_errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 5.times {puts ""}

# puts "the following temples are still in planning"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# dedicator_pattern = /by\s(\S.+)/

# no_temple_errors = []
# no_info_on_temple_errors = []
# other_errors = []

# temple_data.each do |temple|
#   temple_to_modify = Temple.where(name: temple[0]).first
#   if temple_to_modify
#     if temple.length > 2
#       begin
#         temple_to_modify.site_dedicator = dedicator_pattern.match(temple[2])[1]
#       rescue NoMethodError
#         other_errors << temple[0]
#       else
#         temple_to_modify.save
#         puts "the following temple was modified:"
#         puts ""
#         puts temple_to_modify.name
#         puts ""
#         puts ""
#       end
#     else
#       no_info_on_temple_errors << temple[0]
#     end
#   else
#     no_temple_errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples are still in planning"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples dont match pattern"
# counter = 1
# other_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# dedicator_pattern = /by\s(\S.+)/

# no_temple_errors = []
# no_info_on_temple_errors = []
# other_errors = []

# temple_data.each do |temple|
#   temple_to_modify = Temple.where(name: temple[0]).first
#   if temple_to_modify
#     if temple.length > 3
#       begin
#         temple_to_modify.dedication = temple[4]
#       rescue NoMethodError
#         other_errors << temple[0]
#       else
#         temple_to_modify.save
#         puts "the following temple was modified:"
#         puts ""
#         puts temple_to_modify.name
#         puts ""
#         puts ""
#       end
#     else
#       no_info_on_temple_errors << temple[0]
#     end
#   else
#     no_temple_errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples are still in planning"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples dont match pattern"
# counter = 1
# other_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# no_temple_errors = []
# no_info_on_temple_errors = []
# other_errors = []
# no_site_errors = []

# site_pattern = /(\d+.?\d+ acres)/

# temple_data.each do |temple|
#   begin
#     temple_to_modify = Temple.where(name: temple[0]).first
#     if temple_to_modify
#       if temple.length > 4 && temple[5][0..3] == "Site"
#         temple_to_modify.site = site_pattern.match(temple[5])[1]
#         temple_to_modify.save
#         puts "the following temple was modified:"
#         puts ""
#         puts temple_to_modify.name
#         puts ""
#         puts ""
#       else
#         no_info_on_temple_errors << temple[0]
#       end
#     else
#       no_temple_errors << temple[0]
#     end
#   rescue NoMethodError
#     no_site_errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples are still in planning"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples dont match pattern"
# counter = 1
# other_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# no_temple_errors = []
# no_info_on_temple_errors = []
# other_errors = []
# no_site_errors = []

# dedicator_pattern = /by\s(\S.+)/

# temple_data.each do |temple|
#   begin
#     temple_to_modify = Temple.where(name: temple[0]).first
#     if temple_to_modify
#       if temple.length > 4 && temple[4][0..3] == "Dedi"
#         temple_to_modify.dedicator = dedicator_pattern.match(temple[4])[1]
#         temple_to_modify.save
#         puts "the following temple was modified:"
#         puts ""
#         puts temple_to_modify.name
#         puts ""
#         puts ""
#       else
#         no_info_on_temple_errors << temple[0]
#       end
#     else
#       no_temple_errors << temple[0]
#     end
#   rescue NoMethodError
#     no_site_errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples are still in planning"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples dont match pattern"
# counter = 1
# other_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# no_temple_errors = []
# no_info_on_temple_errors = []
# other_errors = []
# no_site_errors = []

# exterior_finish_pattern = /Exterior\sFinish:\S (.+?)\./

# temple_data.each do |temple|
#   begin
#     temple_to_modify = Temple.where(name: temple[0]).first
#     if temple_to_modify
#       if temple.length > 5 && temple[6][0..3] == "Exte"
#         temple_to_modify.exterior_finish = exterior_finish_pattern.match(temple[6])[1]
#         temple_to_modify.save
#         puts "the following temple was modified:"
#         puts ""
#         puts temple_to_modify.name
#         puts ""
#         puts ""
#       else
#         no_info_on_temple_errors << temple[0]
#       end
#     else
#       no_temple_errors << temple[0]
#     end
#   rescue NoMethodError
#     no_site_errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples are still in planning"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples dont match pattern"
# counter = 1
# other_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# no_temple_errors = []
# no_info_on_temple_errors = []
# other_errors = []
# no_site_errors = []

# floor_area_pattern = /Total Floor Area:\S\s(\d+,?\d+ square feet)/

# temple_data.each do |temple|
#   begin
#     temple_to_modify = Temple.where(name: temple[0]).first
#     if temple_to_modify
#       if temple.length > 8 && temple[8][0..3] == "Tota"
#         temple_to_modify.total_floor_area = floor_area_pattern.match(temple[8])[1]
#         temple_to_modify.save
#         puts "the following temple was modified:"
#         puts ""
#         puts temple_to_modify.name
#         puts ""
#         puts ""
#       else
#         no_info_on_temple_errors << temple[0]
#       end
#     else
#       no_temple_errors << temple[0]
#     end
#   rescue NoMethodError
#     no_site_errors << temple[0]
#   end
# end

# puts "the following temples could not be found"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples are still in planning"
# counter = 1
# no_temple_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end

# 3.times {puts ""}

# puts "the following temples dont match pattern"
# counter = 1
# other_errors.each do |error|
#   puts "#{counter}. #{error}"
#   counter +=1
# end