require 'awesome_print'
require 'json'

temple_data = JSON.parse(File.read("db/database.json"), symbolize_names: true)

temple_data.each do |temple|
  Temple.create(temple)
end
