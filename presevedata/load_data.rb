require 'json'

module LoadData
  # Create file path for json file
  def create_file(path)
    #FileUtils.mkdir_p('data')

    File.open(path, 'w') do |file|
      file.puts JSON.generate([])
    end
  end

  # Fetch data from json file
  def fetch_data(path)
    JSON.parse(File.read(path), create_additions: true)
  end

  # Save data to json file
  def save(path, data)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  # Check if file exists
  def file_exist?(filename)
    File.exist? filename
  end

  # Fetch Book data from json file
  def fetch_books
    path = 'data/books.json'
    if file_exist?(path)
      fetch_data(path).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      create_file(path)
      []
    end
  end

  # Fetch Person data from json file
  def fetch_people
    path = 'data/persons.json'
    if file_exist?(path)
      fetch_data(path).map do |person|
        Student.new(person['name'], person['age'], person['id'])
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_rentals
    path = 'data/rentals.json'

    if file_exist?(path)
      fetch_data(path).map do |rental|
        date = rental['date']
        select_person = people.select { |person| person.id == rental['id'] }
        select_book = books.select { |book| book.title == rental['title'] }

        Rental.new(select_person[0], select_book[0], date)
      end
    else
      create_file(path)
      []
    end
  end
end
