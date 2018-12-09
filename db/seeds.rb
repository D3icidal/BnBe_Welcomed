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

# Amenity.create!([
#   {name: "coffee", icon_url: "testam1.jpg", instructions: "turn on, add water", location: "kitchen counter", is_usable: true, home_id: 8},
#   {name: "Washing Machine", icon_url: nil, instructions: "Free to use, soap is in the cabinet", location: "in the garage, light switch near door", is_usable: true, home_id: 8},
#   {name: "Pool", icon_url: nil, instructions: "remove top and add turn on pump", location: "backyard", is_usable: true, home_id: 8},
#   {name: "test1", icon_url: nil, instructions: "test1", location: "test1", is_usable: true, home_id: 8},
#   {name: "test2", icon_url: nil, instructions: "test2", location: "test2", is_usable: true, home_id: 8}
# ])
# Booking.create!([
#   {home_id: 8, checkin: "2018-11-15", checkout: "2018-11-18", checkout_reason: nil, code: nil},
#   {home_id: 8, checkin: "2018-12-10", checkout: "2018-12-29", checkout_reason: nil, code: "dstysy"},
#   {home_id: 15, checkin: "2018-12-17", checkout: "2018-12-26", checkout_reason: nil, code: "eatatt"},
#   {home_id: 8, checkin: "2018-12-18", checkout: "2018-12-20", checkout_reason: nil, code: "test6"}
# ])
# GuestbookComment.create!([
#   {home_id: 8, name: "Johnson Family", comment: "needs more fallout"}
# ])
# Home.create!([
#   {user_id: 17, name: "Optional full-range firmware", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "2195 Lockman Crest", zipcode: "81197", bedrooms: 5, bathrooms: 3, comment_id: nil, state: "WY"},
#   {user_id: 25, name: "Cloned holistic pricing structure", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "2097 Junior Junctions", zipcode: "77364", bedrooms: 4, bathrooms: 2, comment_id: nil, state: "LA"},
#   {user_id: 25, name: "Operative grid-enabled info-mediaries", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "78846 Dinorah Valleys", zipcode: "01377", bedrooms: 2, bathrooms: 3, comment_id: nil, state: "SD"},
#   {user_id: 22, name: "Customer-focused uniform algorithm", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "41279 Kohler Lake", zipcode: "64100", bedrooms: 5, bathrooms: 2, comment_id: nil, state: "ND"},
#   {user_id: 8, name: "Synchronised cohesive circuit", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "22786 Crooks Ferry", zipcode: "30149-9335", bedrooms: 5, bathrooms: 1, comment_id: nil, state: "KS"},
#   {user_id: 15, name: "Self-enabling intermediate alliance", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "9441 Kreiger Plaza", zipcode: "53312-6967", bedrooms: 4, bathrooms: 3, comment_id: nil, state: "IL"},
#   {user_id: 9, name: "Pre-emptive scalable methodology", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "147 Carlton Land", zipcode: "75462-8064", bedrooms: 5, bathrooms: 3, comment_id: nil, state: "WV"},
#   {user_id: 19, name: "Robust global hardware", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "2149 Dare Plaza", zipcode: "82857-5978", bedrooms: 4, bathrooms: 1, comment_id: nil, state: "SD"},
#   {user_id: 24, name: "Self-enabling bifurcated circuit", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "4056 DuBuque Underpass", zipcode: "88988", bedrooms: 3, bathrooms: 3, comment_id: nil, state: "HI"},
#   {user_id: 14, name: "Re-contextualized value-added monitoring", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "242 Stanton Bridge", zipcode: "76005", bedrooms: 1, bathrooms: 2, comment_id: nil, state: "WI"},
#   {user_id: 10, name: "Ameliorated client-driven website", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "8218 Rowe Hollow", zipcode: "74871", bedrooms: 4, bathrooms: 1, comment_id: nil, state: "AR"},
#   {user_id: 23, name: "Reduced intermediate structure", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "92950 Kuhlman Vista", zipcode: "06512", bedrooms: 2, bathrooms: 2, comment_id: nil, state: "NM"},
#   {user_id: 11, name: "Public-key encompassing workforce", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "15762 Enrique Springs", zipcode: "95071", bedrooms: 2, bathrooms: 3, comment_id: nil, state: "VA"},
#   {user_id: 26, name: "Diverse needs-based frame", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "6747 Cruickshank Burgs", zipcode: "63696", bedrooms: 3, bathrooms: 1, comment_id: nil, state: "ID"},
#   {user_id: 25, name: "Public-key global instruction set", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "313 Torphy Route", zipcode: "32030-2553", bedrooms: 2, bathrooms: 1, comment_id: nil, state: "CA"},
#   {user_id: 10, name: "Adaptive human-resource utilisation", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "800 Lorie Shoals", zipcode: "41690-8512", bedrooms: 3, bathrooms: 2, comment_id: nil, state: "CO"},
#   {user_id: 26, name: "Reverse-engineered multi-tasking interface", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "9633 O'Hara Village", zipcode: "64918", bedrooms: 3, bathrooms: 2, comment_id: nil, state: "WY"},
#   {user_id: 8, name: "Cross-group asynchronous project", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "761 O'Connell Parks", zipcode: "60719-3877", bedrooms: 1, bathrooms: 3, comment_id: nil, state: "NH"},
#   {user_id: 15, name: "Profound 4th generation leverage", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "296 Schmeler Club", zipcode: "76064", bedrooms: 1, bathrooms: 2, comment_id: nil, state: "DE"},
#   {user_id: 13, name: "User-friendly local extranet", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "2708 Schulist Mission", zipcode: "27474-6494", bedrooms: 3, bathrooms: 3, comment_id: nil, state: "NJ"},
#   {user_id: 16, name: "Phased even-keeled functionalities", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "437 Daren Parkways", zipcode: "25692-8836", bedrooms: 2, bathrooms: 2, comment_id: nil, state: "TN"},
#   {user_id: 25, name: "Persistent real-time methodology", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "3810 Klocko Club", zipcode: "37307-0373", bedrooms: 3, bathrooms: 1, comment_id: nil, state: "KS"},
#   {user_id: 13, name: "Organic real-time orchestration", is_active: nil, wifi_password: nil, guest_password: nil, street_address: "3109 Williamson Street", zipcode: "95051-8033", bedrooms: 3, bathrooms: 1, comment_id: nil, state: "TN"},
#   {user_id: 7, name: "test vue new home", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "ajuf", zipcode: nil, bedrooms: 0, bathrooms: 9, comment_id: nil, state: nil},
#   {user_id: 7, name: "test vue new home2", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "ajuf", zipcode: nil, bedrooms: 0, bathrooms: 9, comment_id: nil, state: nil},
#   {user_id: 7, name: "ewst", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "", zipcode: nil, bedrooms: nil, bathrooms: nil, comment_id: nil, state: nil},
#   {user_id: 7, name: "", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "", zipcode: nil, bedrooms: nil, bathrooms: nil, comment_id: nil, state: nil},
#   {user_id: 7, name: "Down-sized bandwidth-monitored hierarchy", is_active: "t", wifi_password: nil, guest_password: "password", street_address: nil, zipcode: nil, bedrooms: 8, bathrooms: 5, comment_id: nil, state: nil},
#   {user_id: 7, name: "Extended bottom-line portal", is_active: "t", wifi_password: nil, guest_password: nil, street_address: "somewhere usa", zipcode: nil, bedrooms: 3, bathrooms: 3, comment_id: nil, state: nil}
# ])
# Image.create!([
#   {home_id: 8, url: "test1.jpg"}
# ])
# User.create!([
#   {email: "shamekaaufderhar@bauch.co", phone: "753-667-6108", password_digest: "$2a$10$L5Rm6lLj93mEoSWVTTUNhOLrQiNgpJctgFVOg4M/fQlaZ2/CZ4uZS", first_name: "Lazaro", last_name: "Batz", bio: "Strength through unity! Unity through faith!", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "audreakoelpin@rempel.info", phone: "(715) 381-9985", password_digest: "$2a$10$E9L4MA21/txLkrYC443gzucYf6aZPp/I4kMovb6I913dyFGaOeYX6", first_name: "Dale", last_name: "Howell", bio: "She blinks a lot when she's reading a story she knows is false.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "sanoracorwin@millskeler.com", phone: "1-182-177-8674", password_digest: "$2a$10$a1tr3fkpwoviANC02wK6Suruf53VMo0qbdIHEuIWLojv5JBzSfmCS", first_name: "Jacob", last_name: "Spinka", bio: "You wear a mask for so long, you forget who you were beneath it.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "alya@braun.net", phone: "373-582-5058", password_digest: "$2a$10$XqV8VKIRulP3cfOHQqs.gOtdgi5kH.dRQGAse4tRKNJIf9rlZCApq", first_name: "Ines", last_name: "Schinner", bio: "He cared more about revenge than he did about her.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "antoniofriesen@pfeffer.biz", phone: "475-320-6609", password_digest: "$2a$10$GEYogfSha9HAsynRIrC94.plBKfvjmhSAj1xOEGaYg2JZ6qg.0A0K", first_name: "Rochelle", last_name: "Ernser", bio: "I told you, only truth. For 20 years, I sought only this day. Nothing else existed... until I saw you. Then everything changed. I fell in love with you Evey. And to think I no longer believed I could.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "janea@pfeffer.com", phone: "(812) 450-8669", password_digest: "$2a$10$CPRPQRQRvFa4YlGlkH2WkOVUKj2gxBrPgPOpC6OVsF4NgwiQQTtCu", first_name: "Merri", last_name: "Haag", bio: "I wish I wasn't afraid all the time, but... I am.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "jeromy@lakin.io", phone: "466-078-1902", password_digest: "$2a$10$y7ww8EeRGSOP2wAZyb5nI.DSVQ7zacpdCHZWyvOnW40uOfjL6/70K", first_name: "Gabriel", last_name: "Koch", bio: "Evey? E-V. Of course you are", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "miltonjones@johns.org", phone: "(599) 122-9135", password_digest: "$2a$10$C/gTP0rD1IT9kjO9b1su9ehekxJ/FZdk1FdGUHfAS8lLV5Dh0g3tC", first_name: "Corinna", last_name: "Jaskolski", bio: "Now, this is only an initial report, but at this time, it's believed that during this heroic raid, the terrorist was shot and killed.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "chariamoore@stehr.name", phone: "(454) 769-4317", password_digest: "$2a$10$h4jrPBHBg6qDuhEBUVB9iOU7Sc8R5tzmYun9Wk9WTfRt8JZDw25Hu", first_name: "Eilene", last_name: "Pfeffer", bio: "He cared more about revenge than he did about her.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "leahstark@wisokyreichel.biz", phone: "1-181-482-5322", password_digest: "$2a$10$LxB/ESZYchaDQGsaseyRFejk4E4nTxerC0hQZr2my/tk462MfuvcO", first_name: "Brinda", last_name: "Kilback", bio: "Defiant to the end, huh? You won't cry like him, will you? You're not afraid of death. You're like me.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "pierrerolfson@cruickshank.co", phone: "108-884-0186", password_digest: "$2a$10$xcRRC9yC..FuJpuzMnMgAeH5bg9/YmhHMjIxKqK5BKK6jzjujfLxS", first_name: "Winford", last_name: "Lueilwitz", bio: "Beneath this mask there is more than flesh. Beneath this mask there is an idea, Mr. Creedy. And ideas are bulletproof.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "luciusfadel@bartoletti.org", phone: "1-745-697-2811", password_digest: "$2a$10$mezl08.Sv89coTGQYCIHVuP1b.3FR7UPLcagMFc.ilazlQKKvhEWS", first_name: "Sharda", last_name: "McClure", bio: "Don't run from it, Evey. You've been running all your life.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "davislarson@dickihayes.org", phone: "523-368-4906", password_digest: "$2a$10$efd9gXvkAJLFJ91/iL4vguNanxEWmwN9FJGz2u7Z/GS.TjE1j5KJa", first_name: "Lon", last_name: "Zemlak", bio: "The Ghost of Christmas past.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "ricky@bergstrom.io", phone: "(311) 922-4944", password_digest: "$2a$10$VEv9pY8dt/7HWyaUhNEad.G/04pNRM53mLsZ2oygypfwxm6K8NlDy", first_name: "Jeneva", last_name: "Schumm", bio: "Thank you... but I'd rather die behind the chemical sheds.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "grazynaweimann@auer.org", phone: "561.237.0883", password_digest: "$2a$10$xku.dXKPQxkTDTOe6uE5I.1eAHrIsZBTs4gDDbbcFluMejyvpKRAG", first_name: "Vanessa", last_name: "Casper", bio: "If you accept, put an 'x' on your front door.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "audreystracke@terry.com", phone: "1-550-303-6334", password_digest: "$2a$10$pGKWJxBoHo3RElPfdnsKu.hSoPffBvW4v1Pv8DxNaISGCpPi7Ki6m", first_name: "Dwayne", last_name: "Waters", bio: "I'm a musician of sorts, and on my way to give a very special performance.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "herbweinat@crooks.biz", phone: "(957) 682-6600", password_digest: "$2a$10$MP1b4gfPmzYl9/gdl5dG0.lnzMOXlFzA0FINiYgp6DJrzv2OL0xhq", first_name: "Abbey", last_name: "Mayer", bio: "And thus I clothe my naked villainy, with old odd ends stolen forth from holy writ and seem a saint when most I play the devil.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "agustinabergstrom@greenfelder.name", phone: "1-891-551-0970", password_digest: "$2a$10$cC5H3brjDvUfMQPAvs.dv.GtjSkNnv02Cm.05G0oCjXOqcnqZuDvq", first_name: "Felipe", last_name: "Vandervort", bio: "I wish I wasn't afraid all the time, but... I am.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "kyoko@brekke.biz", phone: "921.597.2969", password_digest: "$2a$10$krXIKvFZ4PALtOEpXQvnd.NEdUpuk5hye76a6eZkyMZrCunCKNMiy", first_name: "Aracely", last_name: "Botsford", bio: "Your powers of observation continue to serve you well.", image_url: "icon.jpg", ip: "192.168.1.1"},
#   {email: "test2@test.com", phone: "6469434615", password_digest: "$2a$10$XQ1OQSGdlR1WDq79RAwXYuzay715jwGxJUPBaU01YD2fqKPd6ZsMe", first_name: "test2", last_name: "test2", bio: "testttttt", image_url: nil, ip: nil},
#   {email: "test9@test.com", phone: nil, password_digest: "$2a$10$lFS0tJoncd6dSGGiICUh.erfA6Ci1U984Nq8A2lIqZ84jz8byHjK6", first_name: nil, last_name: nil, bio: nil, image_url: nil, ip: nil},
#   {email: "test10@test.com", phone: nil, password_digest: "$2a$10$zysOpaqdc028.j78b19y7.X6BtjwSwXLubxmkdslweOeAVbQbh9vK", first_name: "test10", last_name: "test10last", bio: nil, image_url: nil, ip: nil},
#   {email: "test10@test.com", phone: nil, password_digest: "$2a$10$Je9Nak/qKOM107G4kXuzw.C6fSFUBSn4R8uj6CHHRi0KroVaiPTBi", first_name: "test10", last_name: "test10last", bio: nil, image_url: nil, ip: nil},
#   {email: "test12@test.com", phone: nil, password_digest: "$2a$10$AjxQaC8A2QxdoYAvMSGlzuLG.McUvCuN/3EkwuwVzfT5bGDUdKD0e", first_name: "test12", last_name: "test12", bio: nil, image_url: nil, ip: nil},
#   {email: "test12@test.com", phone: nil, password_digest: "$2a$10$doM6S04bzczfTkOp/6Hg6uhPKCj6KnaC9d82OXF.lF/gNtzZdKnzG", first_name: "test12", last_name: "test12", bio: nil, image_url: nil, ip: nil},
#   {email: "test14@test.com", phone: nil, password_digest: "$2a$10$72El0o1feWwmNBGAbeP69.YDMz/jJ2BZCDcmfs/zDrf3eeackdz/2", first_name: "test14", last_name: "test14", bio: nil, image_url: nil, ip: nil},
#   {email: "test@test.com", phone: "704.704.2838", password_digest: "$2a$10$tkUsap/IvTu.a46rCjyyzOOmO2qtaXoGmJH98/ie.HAioTKqEA9Ve", first_name: "Benito", last_name: "Conn", bio: "I remember them arguing at night. Mum wanted to leave the country. Dad refused. He said if we ran away, they would win. Win, like it was a game.", image_url: "icon.jpg", ip: "192.168.1.1"}
# ])
