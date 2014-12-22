require 'nokogiri'
require 'awesome_print'
require 'json'

doc = Nokogiri::XML(File.open("LDSChurchTemples.kml"))

temples_array = []

doc.css('Placemark').each do |placemark|

  temple_hash = {}

  temple_hash["type"] = "Feature"
  temple_hash["geometry"] = {}
  temple_hash["geometry"]["type"] = "Point"
  temple_hash["geometry"]["coordinates"] = [placemark.css('latitude').text,placemark.css('longitude').text]
  temple_hash["properties"] = {}
  temple_hash["properties"]["title"] = placemark.css('name').text
  temple_hash["properties"]["description"] = placemark.css('Snippet').text
  temple_hash["properties"]["marker-color"] = "#ffffff"
  temple_hash["properties"]["marker-symbol"] = "church"
  temples_array << temple_hash

end

features = []

temples_array.each do |temple|
  temple["geometry"]["coordinates"].reverse!.map! do |coordinate|
    coordinate.to_f
  end
  features << temple
end

temples_geoJSON = [
  {
    "type" => "FeatureCollection",
    "features" => features
  }
].to_json

File.open('temples1.geojson', 'w') do |file|
  file.puts temples_geoJSON
end

puts ""
puts "THESE ARE THE TEMPLES!"
puts ""

p temples_geoJSON
