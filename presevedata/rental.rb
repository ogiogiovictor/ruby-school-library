require 'json'
require_relative '../associations/rental'

def save_rentals(rentals)
  @rentals_data = []
  @rentals_data.push({
                       date: rentals.date,
                       person: rentals.person.name,
                       age: rentals.person.age,
                       id: rentals.person.id,
                       book: rentals.book.title
                     })

  File.new('data/rentals.json', 'w+') unless File.exist?('data/rentals.json')
  File.write('data/rentals.json', JSON.generate(@rentals_data)) if File.exist?('data/rentals.json')
  puts "Rental Data successfully written to file\n"
end
