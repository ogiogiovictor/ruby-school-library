require 'json'

def save_book(books)
  @book_data = []

  books.each do |book|
    book_rental = []
    book.rentals.each do |rental|
      book_rental.push({ date: rental.date, person: rental.person.name })
    end

    @book_data.push({ title: book.title, author: book.author, rentals: book_rental })

    File.new('data/books.json', 'w+', JSON.generate(@book_data)) unless File.exist?('data/books.json')
    File.write('data/books.json', JSON.generate(@book_data)) if File.exist?('data/books.json')
    puts "Book data successfully written to file\n"
  end
end
