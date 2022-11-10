class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Has-Many relationship
  def add_student(student)
    @students.push(student)
    # Add student to the classroom students array
    student.classroom = self
  end
end

# stu = Classroom.new('John')
# p stu.add_student('John Vick')
