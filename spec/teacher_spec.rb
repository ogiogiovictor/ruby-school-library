
require_relative '../classes/teacher'

describe Teacher do
    context 'Testing the class Teacher' do

        before :each do
            @teacher = Teacher.new(35, 'Jamal James', 'Frontend Designer')
          end
        
          it '@teacher should be an instance of the class teacher' do
            expect(@teacher).to be_instance_of Teacher
          end
      
          it "@teacher's age should be 35, name shoud be Jamal James and specialization should be Frontend Designer" do
            expect(@teacher.age).to eq(35)
            expect(@teacher.name).to eq('Jamal James')
            expect(@teacher.specialization).to eq('Frontend Designer')
          end

          it 'The method can_use_services? should be available for the instances @teacher' do
            expect(@teacher).to respond_to(:can_use_services?)
          end

    end
end