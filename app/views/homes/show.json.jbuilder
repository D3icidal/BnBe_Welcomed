# json.partial! "home.json.jbuilder", home: @home
json.details @home
json.host_first_name @home.user.first_name
json.host_last_name @home.user.last_name
json.host_image_url @home.user.image_url
json.host_email @home.user.email
json.host_phone @home.user.phone
json.amenities @home.amenities