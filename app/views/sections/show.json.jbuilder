json.array! @sections do |section|
  json.partial! "section.json.jbuilder", section: section
end
# json.partial! "sections/section", section: @section