# require 'mechanize'
require 'open-uri'
#Scraping for SAT locations
page1 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201701&country=US&state=CA&city="))

 january_nokogiri = page1.css('div.test-center-results-row')
 january_locations = []

 january_nokogiri.each do |school|
   schools = {}
   schools[:name] = school.css('h3').text
   schools[:address] = school.css('.test-center-result-value').text.split(" ").join(" ")
   january_locations << schools
 end


 january_locations.each do |school|
   Sat.create(location_name: school[:name], address: school[:address], date: 20170121, completed: false )
 end

################################################################################
page2 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201703&country=US&state=CA&city="))
march_nokogiri = page2.css('div.test-center-results-row')
march_locations = []

march_nokogiri.each do |school|
  schools = {}
  schools[:name] = school.css('h3').text
  schools[:address] = school.css('.test-center-result-value').text.split(" ").join(" ")
  march_locations << schools
end


march_locations.each do |school|
  Sat.create(location_name: school[:name], address: school[:address], date: 20170311, completed: false )
end
################################################################################
page3 = page2 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201705&country=US&state=CA&city="))
may_nokogiri = page3.css('div.test-center-results-row')
may_locations = []

may_nokogiri.each do |school|
  schools = {}
  schools[:name] = school.css('h3').text
  schools[:address] = school.css('.test-center-result-value').text.split(" ").join(" ")
  may_locations << schools
end


may_locations.each do |school|
  Sat.create(location_name: school[:name], address: school[:address], date: 20170506, completed: false )
end

################################################################################
page4 = page2 = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201706&country=US&state=CA&city="))
june_nokogiri = page4.css('div.test-center-results-row')
june_locations = []

june_nokogiri.each do |school|
  schools = {}
  schools[:name] = school.css('h3').text
  schools[:address] = school.css('.test-center-result-value').text.split(" ").join(" ")
  june_locations << schools
end


june_locations.each do |school|
  Sat.create(location_name: school[:name], address: school[:address], date: 20170603, completed: false )
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



    # entries = doc.css('.entry')
    # entriesArray = []
    # entries.each do |entry|
    #   title = entry.css('p.title>a').text
    #   link = entry.css('p.title>a')[0]['href']
    #   entriesArray << Entry.new(title, link)
    # end
