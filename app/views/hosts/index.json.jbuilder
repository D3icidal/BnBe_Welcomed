json.array! @hosts do |host|
  json.partial! "host.json.jbuilder", host: host
end
