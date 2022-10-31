require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age, name = 'Unknown', parent_permission: true, specialization: 'Unknown')
    super(id, name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new(1, 'John', 2, parent_permission: true, specialization: 'Doctor')
p teacher.can_use_services?
