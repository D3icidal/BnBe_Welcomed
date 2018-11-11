# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# homes = Home.all
# homes.each do |i|
#   i.delete
# end  

# 20.times do 
#   Host.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,
#   phone: Faker::PhoneNumber.cell_phone,
#   bio: Faker::VForVendetta.quote,
#   image_url: "icon.jpg",
#   password: "password",
#   password_confirmation: "password",
#   ip: "192.168.1.1"
#   )
# end


# 25.times do 
#   Home.create(
#   name: Faker::Company.catch_phrase,
#   host_id: Host.all.sample.id,
#   is_active: true,  # !!!! => "t"
#   wifi_password: nil,
#   bedrooms: rand(1..5),
#   bathrooms: rand(1..3),
#   street_address: Faker::Address.street_address,
#   zipcode: Faker::Address.zip,
#   state: Faker::Address.state_abbr
#   )
# end