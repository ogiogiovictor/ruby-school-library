require_relative './associations/book'
require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './presevedata/book'
require_relative './presevedata/person'
require_relative './presevedata/rental'
require_relative './preserve_data'
require_relative './presevedata/load_data'

class App
  include LoadData

  def initialize
    @books = fetch_books
    @people = fetch_people
    @rentals = [] if @rentals.nil?
    # @rentals = fetch_rentals
  end

  attr_accessor :books, :people, :rentals

  def list_books(option)
    puts 'No Books: ' if @books.length.zero?
    puts "List of books:\n" if option == '1'
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts "\n"
  end

  def create_book
    # @books.clear
    puts 'Please enter the title of the book: '
    title = gets.chomp
    puts 'Please enter the author of the book: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    puts "\n"
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts 'Student created successfully'
    puts "\n"
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher created successfully'
    puts "\n"
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    puts 'Enter Age: '
    age = gets.chomp.to_i
    puts 'Enter Name: '
    name = gets.chomp.to_s
    case option
    when '1'
      puts 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      create_student(age, name, parent_permission)
    when '2'
      puts 'Specialization: '
      specialization = gets.chomp.to_s
      create_teacher(age, name, specialization)
    else
      puts 'That is not a valid input'
      puts "\n"
    end
  end

  def list_all_persons(option)
    puts 'No Persons: ' if @people.length.zero?
    puts "List of Persons:\n" if option == '2'
    @people.each do |person|
      puts "Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    @rentals = Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
    puts "\n"
  end

  def list_all_rentals_for_person_id
    puts 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  def save_json_data
    save_book(@books)
    save_person(@people)
    save_rentals(@rentals)
  end
end
