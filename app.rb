require_relative './associations/book'
require_relative './classes/person'

class App
  attr_accessor :books, :people

  def initialize
    @books = [],
             @people = []
  end

  def list_books
    puts 'List of books: ' if @book.length.zero?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    @people.each do |person|
      puts person
    end
  end
end
