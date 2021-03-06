json.details @home
json.host_first_name @home.user.first_name
json.host_last_name @home.user.last_name
json.host_image_url @home.user.image_url
json.host_email @home.user.email
json.host_phone @home.user.phone
json.home_images @home.images.first
json.weather  @weather

amenities = @home.amenities
if amenities.count < 4 && amenities.count > 0 
  puts "\n\n\n\tAmenities <4: #{amenities}\t********\n\n\n"
  p amenities + Amenity.first.example(@home.id)
  amenities = @home.amenities + Amenity.first.example(@home.id)
  json.amenities amenities
elsif @home.amenities.count == 0 #|| @home.amenities != true
  json.amenities Amenity.first.example(@home.id)
else
  json.amenities @home.amenities
end