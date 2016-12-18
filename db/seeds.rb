# require 'mechanize'
require 'open-uri'
#Scraping for SAT locations
page = Nokogiri::HTML(open("https://collegereadiness.collegeboard.org/api/v1/test-center-search?test_date=201701&country=US&state=CA&city="))

sat_objects =  page.css('div.test-center-results-row')[0].text
 all_objects = page.css('div.test-center-results-row')
 schools_array = []
 all_objects.each do |school|
   schools = {}
   schools[:name] = school.css('h3').text
   schools[:address] = school.css('.test-center-result-value').text.split(" ").join(" ")
   schools_array << schools
 end


 schools_array.each do |school|
   Sat.create(location_name: school[:name], address: school[:address] )
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

  
