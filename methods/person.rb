class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # private
  def of_age?
    @age >= 18
    # true if @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
    # true if is_of_age? || @parent_permission
  end

  def setname(name)
    @name = name
  end

  def setage(age)
    @age = age
  end
end

# Path: student.rb
person = Person.new(1, 6, 'John')
p person.can_use_services?
