require 'spec_helper'


describe Rental do
    context 'Testing the class Rental' do

        before :each do
            @person = Person.new(12, 'Mark Fish', parent_permission: false)
            @book = Book.new('Rich al Cry', 'EvenlyTown')
            @rental = Rental.new('2020-10-18', @book, @person)
        end

          it '@rental should be an instance of the class Rental' do
            expect(@rental).to be_instance_of Rental
          end

          it "@rental's person parent_permission should be false, age should be 16 and name should be Mark Fish" do
            expect(@rental.person.age).to eq(12)
            expect(@rental.person.name).to eq('Mark Fish')
          end
    end

end