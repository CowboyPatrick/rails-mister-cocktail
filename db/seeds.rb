# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating Seeds..."
require 'open-uri'
# https://github.com/flori/json
require 'json'
# http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
# Construct the URL we'll be calling
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
Ingredient.destroy_all
puts "Cleaned up database"
# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read
result = JSON.parse(buffer)
result["drinks"].each do |i|
  Ingredient.create!(name: i['strIngredient1'])
end

puts "#{Ingredient.count} ingredients"
