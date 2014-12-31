require 'nokogiri'

p Dir.pwd
doc = Nokogiri::XML(File.open("db/LDSChurchTemples.kml"))

# ap doc


################################################################################
####################### SCRIPT TO EXTRACT TEMPLE NAMES #########################
################################################################################

temple_names = []

doc.css('name').each do |name|
  temple_names << name.text
end

temple_names = temple_names[2..-1]


################################################################################
##################### SCRIPT TO EXTRACT TEMPLE SNIPPETS ########################
################################################################################

temple_snippets = []

doc.css('Snippet').each do |name|
  temple_snippets << name.text
end


################################################################################
############ SCRIPT TO EXTRACT LINKS TO MORE DETAILED TEMPLE INFO ##############
################################################################################

info_link_pattern = /href="(http:\/\/www.ldschurchtemples.com\/\w+\/)"><img/


temple_links = []

doc.css('Placemark').each do |placemark|
  temple_links << placemark.text.match(info_link_pattern)
end

temple_links.map! do |data|
    data = data.captures.first
end

# ap temple_links

################################################################################
################ SCRIPT TO EXTRACT TEMPLE PHYSICAL ADDRESSES ###################
################################################################################

first_round_address_pattern = /<br>(.*)<\/a><br>/m #BROKEN BROKEN BROKEN

delete_phone_pattern = /Phone:&nbsp.+/

temple_addresses = []

doc.css('Placemark').each do |placemark|
  temple_addresses << placemark.text.match(first_round_address_pattern)
end


temple_addresses.map! do |temple|
  if temple == nil
    "EXCEPTION! Use index to figure out what temple & fix"
  else
    temple.captures.first
  end
end

temple_addresses.map! do |temple|
  if temple.include?("EXCEPTION")
    temple
  else
    temple.sub!("\n<br>\n", "")
  end
end

temple_addresses.map! do |temple|
  if temple.include?("EXCEPTION")
    temple
  else
    temple.gsub!("<br>\n", " • ")
  end
end

temple_addresses.map! do |temple|
  if temple.include?("EXCEPTION")
    temple
  else
    temple.gsub!(delete_phone_pattern, "")
  end
end

# ap temple_addresses

################################################################################
################ SCRIPT TO EXTRACT TEMPLE GEOLOCATION COORDS ###################
################################################################################


temple_coordinates = []

doc.css('Placemark').each do |placemark|
  temple_coordinates << placemark.css('coordinates').text
end

temple_coordinates.map! do |coordinates|
  coordinates.split(",")[0..1].map! {|coord| coord.to_f}
end


################################################################################
################ SCRIPT TO SEED THE DATABASE YESSS FINALLY!! ###################
################################################################################


counter = 0

# 170.times do
#   Temple.create(name: temple_names[counter], snippet: temple_snippets[counter], address: temple_addresses[counter], link: temple_links[counter], latitude: temple_coordinates[counter][0], longitude: temple_coordinates[counter][1])
#   counter += 1
# end
