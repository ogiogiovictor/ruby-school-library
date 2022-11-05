require_relative 'person'

class Teacher < Person
  attr_accessor :specialization
  attr_reader :id

  def initialize(age, name = 'Unknown', specialization = 'Teacher')
    super(age, name)
    @specialization = specialization
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    true
  end
end

# teacher = Teacher.new(15, 'John', parent_permission: true, specialization: 'Doctor')
# p teacher.can_use_services?
