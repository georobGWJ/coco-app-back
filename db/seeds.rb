# require 'mechanize'
require 'open-uri'
#Scraping for SAT locations
page1 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201701&country=US&state=CA&city="))

 january_nokogiri = page1.css('div.test-center-results-row')
 january_locations = []

 january_nokogiri.each do |school|
   schools = {}
   schools[:name] = school.css('h3').text
   schools[:address] = school.css('.test-center-result-value').text.split(" ")[0...-1].join(' ')
   january_locations << schools
 end


 january_locations.each do |school|
   Sat.create(location_name: school[:name], address: school[:address], date: 20170121 )
 end

################################################################################
page2 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201703&country=US&state=CA&city="))
march_nokogiri = page2.css('div.test-center-results-row')
march_locations = []

march_nokogiri.each do |school|
  schools = {}
  schools[:name] = school.css('h3').text
  schools[:address] = school.css('.test-center-result-value').text.split(" ")[0...-1].join(' ')
  march_locations << schools
end


march_locations.each do |school|
  Sat.create(location_name: school[:name], address: school[:address], date: 20170311 )
end
################################################################################
page3 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201705&country=US&state=CA&city="))
may_nokogiri = page3.css('div.test-center-results-row')
may_locations = []

may_nokogiri.each do |school|
  schools = {}
  schools[:name] = school.css('h3').text
  schools[:address] = school.css('.test-center-result-value').text.split(" ")[0...-1].join(' ')
  may_locations << schools
end


may_locations.each do |school|
  Sat.create(location_name: school[:name], address: school[:address], date: 20170506 )
end

################################################################################
page4 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201706&country=US&state=CA&city="))
june_nokogiri = page4.css('div.test-center-results-row')
june_locations = []

june_nokogiri.each do |school|
  schools = {}
  schools[:name] = school.css('h3').text
  schools[:address] = school.css('.test-center-result-value').text.split(" ")[0...-1].join(' ')
  june_locations << schools
end


june_locations.each do |school|
  Sat.create(location_name: school[:name], address: school[:address], date: 20170603 )
end


################################################################################
zara = User.create(first_name:"Zara", last_name: "Aslam", email:"zara@zara.com", password: "password", phone_number: "+15105579120", street_address: "221 7th Street", city:"San Francisco", state: "CA", zip_code: 94105, lang_preference: "spanish", grade_level: 9, user_type: "parent")

rob = User.create(first_name:"Rob", last_name: "Turner", email:"rob@rob.com", password: "password", phone_number: "+19252474748", street_address: "3259 Madera Avenue", city:"San Francisco", state: "CA", zip_code: 94619, lang_preference: "english", grade_level: 10, user_type: "parent")

julia = User.create(first_name:"Julia", last_name: "Yulak", email:"julia@julia.com", password: "password", phone_number: "+14155188406", street_address: "8735 Holbrook Street", city:"Los Angeles", state: "CA", zip_code: 90660, lang_preference: "spanish", grade_level: 10, user_type: "parent")

angie = User.create(first_name:"Angie", last_name: "Gonzalez", email:"angie@angie.com", password: "password", phone_number: "+13102920098", street_address: "2543 Congress Street", city:"San Diego", state: "CA", zip_code: 92110, lang_preference: "spanish", grade_level: 12, user_type: "parent")

arlene = User.create(first_name:"Arlene", last_name: "Perez", email:"arlene@arlene.com", password: "password", phone_number: "+15623221545", street_address: "6504 Pardall Rd", city:"Isla Vista", state: "CA", zip_code: 93117, lang_preference: "spanish", grade_level: 11, user_type: "student")

jose = User.create(first_name:"Jose", last_name: "Gonzalez", email:"jose@jose.com", password: "password", phone_number: "+13102920098", street_address: "2543 Congress Street", city:"San Diego", state: "CA", zip_code: 92110, lang_preference: "english", grade_level: 12, user_type: "student")

maria = User.create(first_name:"Maria", last_name: "Yulak", email:"maria@maria.com", password: "password", phone_number: "+14155188406", street_address: "8735 Holbrook Street", city:"Los Angeles", state: "CA", zip_code: 90660, lang_preference: "english", grade_level: 10, user_type: "parent")

################################################################################
chat1 = Chat.create(content:"What is an AP course?", user_id: julia.id)
chat2 = Chat.create(content:"An AP course is an Advanced Placement Course that provides an exam at the end of the year, and if passed, you receive college credit!", user_id: angie.id)
chat3 = Chat.create(content:"I can't afford to pay for my child's SAT tests. ", user_id: julia.id)
chat4 = Chat.create(content:"There's waivers for SAT tests, ask your school counselor!", user_id: angie.id)

################################################################################
message1 = Message.create(title: "Scholarships",content:"Are there scholarships available for CA schools?", user_id: julia.id)
message2 = Message.create(title: "SAT",content:"What are some tips for taking the SAT?", user_id: angie.id)
message3 = Message.create(title: "SAT",content:"Simple and free resources on Khan Academy for SAT courses!", user_id: julia.id)
message4 = Message.create(title: "Financial Aid",content:"Where can I apply for scholarships and financial aid?", user_id: angie.id)

################################################################################
comment1 = Comment.create(content:"Yes! Check on fastweb.com!", user_id: rob.id, message_id: message1.id)
comment2 = Comment.create(content:"What are some tips for taking the SAT?", user_id: rob.id, message_id: message2.id)
comment3 = Comment.create(content:"Simple and free resources on Khan Academy for SAT courses!", user_id: rob.id, message_id: message3.id)
comment4 = Comment.create(content:"Where can I apply for scholarships and financial aid?", user_id: rob.id, message_id: message4.id)

################################################################################
users = [jose,maria,arlene]
users.each do |user|
  user.requirements.create(subject:"History", years: 0)
  user.requirements.create(subject:"English", years: 0)
  user.requirements.create(subject:"Math", years: 0)
  user.requirements.create(subject:"Science", years: 0)
  user.requirements.create(subject:"Language", years: 0)
  user.requirements.create(subject:"Arts", years: 0)
  user.requirements.create(subject:"Elective", years: 0)
end





# sat_locations = Mechanize.new
#
# page = sat_locations.get('https://collegereadiness.collegeboard.org/sat/register/find-test-centers')
#
# form = page.forms.first
# form.field_with(:name => "state").option_with(:value => "CA").click
# #Click on submit to attain locations
# # results = form.submit
# results = sat_locations.submit(form, form.buttons.first)
#
# results.search('.test-center-results').each do |location|
#   puts location.text.strip
# end
