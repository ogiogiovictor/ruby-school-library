require_relative './app'

def choose_options
  puts 'Please choose an option by entering a number:'
  @options = {1=> "List all books", 2=> "List all people", 3=> "Create a person", 4=> "Create a book", 5=> "Create a rental", 6=> "List all rentals for a given person id", 7=> "Exit"}
 
  @options.each { |key, value| puts "#{key} - #{value}" + "\n" }

  # puts '1 - List all books'
  # puts '2 - List all people'
  # puts '3 - Create a person'
  # puts '4 - Create a book'
  # puts '5 - Create a rental'
  # puts '6 - List all rentals for a given person id'
  # puts '7 - Exit'
end

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts "\n"

  loop do
    choose_options
    option = gets.chomp

    case option
    when '1'
      app.list_books(option)
    when '2'
      app.list_all_persons(option)
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rentals_for_person_id
    when '7'
      puts 'Thank you for using this app!'
      break
    else
      puts 'That is not a valid option'
      sleep(1)
    end
    puts "\n"
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

main
