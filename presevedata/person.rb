require 'json'

def save_person(data)
  @people_data = []

  data.each do |person|
    @people_data.push({ name: person.name, age: person.age, id: person.id,
                        parent_permission: person.parent_permission })
  end
  File.new('data/persons.json', 'w+') unless File.exist?('data/persons.json')
  File.write('data/persons.json', JSON.generate(@people_data)) if File.exist?('data/persons.json')
  puts "Person Data successfully written to file\n"
end
