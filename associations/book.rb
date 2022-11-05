require_relative './rental'
class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @id = Random.rand(1..1000)
  end

  # Create the has-many side of Book and Rental (a book has many rentals).
  def add_rental(rental)
    @rentals.push(rental)
  end

  # def add_rental(person, date)
  #   Rental.new(date, self, person)
  # end

end
