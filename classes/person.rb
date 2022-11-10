require_relative '../decorator/nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', specialization = 'unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @specialization = specialization
    @id = Random.rand(1..1000)
    @rentals = []
  end

  def can_use_services?
    of_age? && @parent_permission
  end

  private

  def of_age?
    @age >= 18
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
  # def add_rental(rental)
  # @rentals.push(rental) # Add the rental to the person's rentals
  # person.rental = self # Add rental to the person rental array
  # end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

# person = Person.new(1, 26, 'John')
# person = Person.new(22, 15, 'maximilianus')
# p person.can_use_services?
# p person.correct_name
