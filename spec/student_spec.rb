require 'spec_helper'

describe Student do
  context 'It should add a student' do
    student = Student.new(28, 'Tadesse', 'new classroom', parent_permission: true)

    it 'student should be an instance of class Student' do
      expect(student).to be_an_instance_of(Student)
    end

    it 'expects method play hooky to return ¯\\(ツ)/¯' do
      expect(student.play_hooky).to eql('¯\\(ツ)/¯')
    end

    it 'creates a student with permission' do
      expect(student.can_use_services?).to eq true
    end
  end
end
