require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person ID'
    puts '7. Quit'
    option(app)
  end
end

def option(app)
  option = gets.chomp
  case option
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.rental_list
  else
    exit_option
  end
end

def exit_option
  puts 'Thank you for using our library ¯\^-^/¯'
  exit
end

main
