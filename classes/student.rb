require_relative 'person'

class Student < Person
  # Belong-to relationship
  attr_accessor :parent_permission
  attr_reader :id, :classroom

  def initialize(age, name = 'Unknown', classroom = 'none', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @id = Random.rand(1..1000)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

# student = Student.new(35, 17, 'Daniel', parent_permission: true, classroom: 'Math')
# p student.play_hooky
# p student.setname('daniel')
# persons = Person.new(1, 26, 'John')
# p persons
# p persons.can_use_services?
