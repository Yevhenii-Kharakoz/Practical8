require 'open-uri'
require 'nokogiri'
require 'csv'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'
html = URI.open(url)
doc = Nokogiri::HTML(html)

CSV.open('hospitals.csv', 'wb') do |csv|
  csv << ['Hospital Name']

  doc.css('.column1').each do |hospital_name|
    name = hospital_name.text.strip

    csv << [name]
  end
end

puts 'Назви госпіталей було збережено у файл hospitals.csv'
