require 'nokogiri'
require 'awesome_print'
require 'json'

doc = Nokogiri::XML(File.open("LDSChurchTemples.kml"))

temples_array = []

doc.css('Placemark').each do |placemark|

  temple_hash = {}

  temple_hash["type"] = "Feature"
  p temple_hash["type"]
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

counter = 1

temples_geoJSON = []

puts "These are the temples!"

temples_array.each do |temple|
  temple["geometry"]["coordinates"].map! do |coordinate|
    coordinate.to_f
  end
  temples_geoJSON << temple.to_json
end

temples_geoJSON.each do |json|
  puts json
  5.times { puts "" }
end








# {"type"=>"Feature",
#  "geometry"=>
#  {"type"=>"Point", "coordinates"=>[19.13441, -96.10626]}, "properties"=>{"title"=>"Veracruz Mexico Temple", "description"=>"93rd operating temple", "marker-color"=>"#ffffff", "marker-symbol"=>"church"}}






# var geojson = [
#   {
#     "type": "Feature",
#     "geometry": {
#       "type": "Point",
#       "coordinates": [-77.03238901390978,38.913188059745586]
#     },
#     "properties": {
#       "title": "Mapbox DC",
#       "description": "1714 14th St NW, Washington DC",
#       "marker-color": "#fc4353",
#       "marker-size": "large",
#       "marker-symbol": "monument"
#     }
#   },
#   {
#     "type": "Feature",
#     "geometry": {
#       "type": "Point",
#       "coordinates": [-122.414, 37.776]
#     },
#     "properties": {
#       "title": "Mapbox SF",
#       "description": "155 9th St, San Francisco",
#       "marker-color": "#fc4353",
#       "marker-size": "large",
#       "marker-symbol": "harbor"
#     }
#   }
# ];




# doc.css('Placemark').each do |placemark|
#   ap placemark.css('description')
# end
