json.array! @homes do |home|
  json.partial! "home.json.jbuilder", home: home
end
