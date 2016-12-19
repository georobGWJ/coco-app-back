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
zara = User.create(first_name:"Zara", last_name: "Aslam", email:"zara@zara.com", password: "password", phone_number: "+15105579120", street_address: "221 7th Street", city:"San Francisco", state: "CA", zip_code: 94105, lang_preference: "spanish", grade_level: 9, user_type: "student")

rob = User.create(first_name:"Rob", last_name: "Turner", email:"rob@rob.com", password: "password", phone_number: "+19252474748", street_address: "3259 Madera Avenue", city:"San Francisco", state: "CA", zip_code: 94619, lang_preference: "english", grade_level: 10, user_type: "student")

julia = User.create(first_name:"Julia", last_name: "Yulak", email:"julia@julia.com", password: "password", phone_number: "+14155188406", street_address: "8735 Holbrook Street", city:"Los Angeles", state: "CA", zip_code: 90660, lang_preference: "spanish", grade_level: 12, user_type: "parent")

angie = User.create(first_name:"Angie", last_name: "Gonzalez", email:"angie@angie.com", password: "password", phone_number: "+13102920098", street_address: "2543 Congress Street", city:"San Diego", state: "CA", zip_code: 92110, lang_preference: "spanish", grade_level: 12, user_type: "parent")

arlene = User.create(first_name:"Arlene", last_name: "Perez", email:"arlene@arlene.com", password: "password", phone_number: "+15623221545", street_address: "6504 Pardall Rd", city:"Isla Vista", state: "CA", zip_code: 93117, lang_preference: "spanish", grade_level: 11, user_type: "student")




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
