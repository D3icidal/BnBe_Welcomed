json.id home.id
json.user_id home.user_id
json.name home.name
json.guestbook_comments home.guestbook_comments
json.is_active home.is_active 
json.wifi_password home.wifi_password 
json.guest_password home.guest_password
json.guest_password_new ""
json.errors []
json.bedrooms home.bedrooms 
json.bathrooms home.bathrooms 
json.zipcode home.zipcode 
json.state home.state 
json.images_count home.images.count
json.created_at home.created_at 
json.updated_at home.updated_at 
if home.images.count == 0
  json.images [{url: "https://images.unsplash.com/photo-1449844908441-8829872d2607?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80", home_id: home.id}]
else
  json.images   home.images
end
