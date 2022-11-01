require_relative 'person'

class Student < Person
  # Belong-to relationship
  attr_accessor :classroom, :id

  def initialize(id, age, name = 'Unknown', parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    @id = id
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student = Student.new(15, 17, 'Daniel', parent_permission: true, classroom: 'Math')
p student.play_hooky
