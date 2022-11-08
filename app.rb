require 'json'
require_relative './associations/book'
require_relative './classes/person'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './preserve_data'

class App
  def initialize
    @books = [] if @book.nil?
    @people = [] if @people.nil?
    @rentals = [] if @rentals.nil?
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
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
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
end

def save_data(data, file)
  json = JSON.generate(data)
  File.write("#{file}.json", json)
end

def recover_data(file)
  return unless File.exist?("#{file}.json") == true

  json = File.read("#{file}.json")
  JSON.parse(json, create_additions: true)
end

# store0 = Book.new('this is ethiopia', 'tadesse')
# json0 = JSON.generate(store0)
# obj0 = JSON.parse(json0)
# ruby1 = JSON.parse(json0, create_additions: true)

# store1 = Person.new(12, 'Marck', parent_permission: true)
# json1 = JSON.generate(store1)
# obj1 = JSON.parse(json1)
# ruby2 = JSON.parse(json1, create_additions: true)
