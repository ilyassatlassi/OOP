require_relative 'app'

def main
  app = App.new

  loop do
    puts 'Choose an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person ID'
    puts '7. Quit'
    choose_option(app)
  end
end



main