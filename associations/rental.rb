class Rental 

    attr_accessor  :date, :book, :person


    def initialize(date, book, person)
        @date = date
        @book = book
        book.rentals << self # Add rental to the book rentals array
        @person = person  # Create the belongs-to side of Rental and Person (a rental belongs to a person).
        person.rentals << self # Add rental to the person rentals array
    end

end