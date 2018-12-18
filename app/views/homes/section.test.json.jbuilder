@sections = [{name: 'welcome', data: 'welcomedata'}, {name: 'goodbye', data: 'goodbyedata'}, {name: 'hello', data: 'hellodata'}, ]

if @sections
  puts @sections
else
  puts "Sections failed, @sections: #{@sections}"
end