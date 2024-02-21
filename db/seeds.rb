require 'faker'
require_relative '../app/models/flat.rb'

puts 'Cleaning database...'
Flat.destroy_all

nr_of_flats = 5
rating_min = 0.0
rating_max = 5.0

puts 'Creating flats...'
nr_of_flats.times do |_|
  name = Faker::App.name
  address = Faker::Address.street_address
  city = Faker::Address.city
  description = Faker::Adjective.positive
  price_per_night = rand(50..500)
  number_of_guests = rand(2..10)
  rating = rand(rating_min..rating_max)
  flat_int = rand(1..10)
  image_url = "flats/flat-#{'0' if flat_int < 10}#{flat_int}.jpg"

  flat = Flat.new(name:, address:, city:, description:, price_per_night:, number_of_guests:, rating:, image_url:)
  flat.save
  puts "Created flat: #{name}"
end

puts 'Finished seed!'
