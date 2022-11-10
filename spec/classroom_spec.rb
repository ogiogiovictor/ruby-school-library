require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Classroom do
  context 'Testing the class Classroom' do
    before :each do
      @classroom = Classroom.new('6')
    end

    it '@classroom should be an instance of the class classroom' do
      expect(@classroom).to be_instance_of Classroom
    end

    it "@classroom's label should be 5A" do
      expect(@classroom.label).to eq('6')
    end

    it 'The method add_student should be available for the instances @classroom' do
      expect(@classroom).to respond_to(:add_student)
    end
  end
end
# rubocop:enable Metrics/BlockLength
