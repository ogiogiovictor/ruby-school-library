require_relative './app'

def choose_options
  puts 'Please choose an option by entering a number:'
  @options = { 1 => 'List all books', 2 => 'List all people', 3 => 'Create a person', 4 => 'Create a book',
               5 => 'Create a rental', 6 => 'List all rentals for a given person id', 7 => 'Exit' }
  @options.each { |key, value| puts "#{key} - #{value}\n" }
end

# rubocop:disable Metrics/CyclomaticComplexity
def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts "\n"

  loop do
    choose_options
    selected = gets.chomp

    app.list_books(selected) if selected.to_i == 1
    app.list_all_persons(selected) if selected.to_i == 2
    app.create_person if selected.to_i == 3
    app.create_book if selected.to_i == 4
    app.create_rental if selected.to_i == 5
    app.list_all_rentals_for_person_id if selected.to_i == 6
    puts 'Thank you for using this app!' if selected.to_i == 7
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
main
