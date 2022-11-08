require 'json'

# store data in json file
class Book
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [title, author]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

# store class room data in json file
class Classroom
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [label]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

class Person
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => age,
      'name' => name,
      'id' => id,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'], object['age'], object['id'], parent_permission: object['parent_permission'])
  end
end

class Students < Person
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => age,
      'name' => name,
      'id' => id,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['age'], object['name'], object['id'], parent_permission: object['parent_permission'])
  end
end

class Teacher < Person
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => ['name', @specialization, 'age', 'id']
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end

class Rental
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => date,
      'book' => book,
      'people' => people
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['date'], object['book'], object['people'])
  end
end
