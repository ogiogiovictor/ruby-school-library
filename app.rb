require_relative './associations/book'
require_relative './classes/person'

class App

    attr_accessor :books, :people

    def initialize
        @books = [],
        @people = []
    end

    def list_all_books
        @books.each { |book| puts book }
    end

    def list_all_persons
        @people.each do |person|
            puts person
        end
    end

end