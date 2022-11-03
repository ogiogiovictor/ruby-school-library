require_relative './decorator/nameable'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def setname(name)
    @name = name
  end

  def setage(age)
    @age = age
  end

  def correct_name
    @name
  end
  # Has-many side of Person and Rental (a person has many rentals).
  def add_rental(rental)

    @rental.push(rental) # Add the rental to the person's rentals
    person.rental = self # Add rental to the person rental array
  end
end

#person = Person.new(1, 26, 'John')
person = Person.new(22, 15, 'maximilianus')
#p person.can_use_services?
p person.correct_name
