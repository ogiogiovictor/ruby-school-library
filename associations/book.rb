class Book

    attr_accessor :title, :author, :rentals

    def initialize(title, author)
        @title = title
        @author = author
        @rentals = []
    end

    # Create the has-many side of Book and Rental (a book has many rentals).
    def add_rental(rental)
        @rentals.push(rental)
    end


end