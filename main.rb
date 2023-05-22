# require_relative 'app'

# def main
#   app = App.new
#   puts 'Welcome to School Library App!'
#   loop do
#     puts 'Please choose an option by entering a number:'
#     puts '1. List all books'
#     puts '2. List all people'
#     puts '3. Create a person'
#     puts '4. Create a book'
#     puts '5. Create a rental'
#     puts '6. List all rentals for a given person ID'
#     puts '7. Quit'
#     option(app)
#   end
# end

# def option(app)
#   option = gets.chomp
#   case option
#   when '1'
#     app.list_books
#   when '2'
#     app.list_people
#   when '3'
#     app.create_person
#   when '4'
#     app.create_book
#   when '5'
#     app.create_rental
#   when '6'
#     app.rental_list
#   else
#     exit_option
#   end
# end

# def exit_option
#   puts 'Thank you for using our library ¯\^-^/¯'
#   exit
# end

# main
require_relative 'app'

class Menu
    MENU_OPTIONS = [
        { number: '1', label: 'List all books', action: :list_books },
        { number: '2', label: 'List all people', action: :list_people },
        { number: '3', label: 'Create a person', action: :create_person },
        { number: '4', label: 'Create a book', action: :create_book },
        { number: '5', label: 'Create a rental', action: :create_rental },
        { number: '6', label: 'List all rentals for a given person ID', action: :rental_list },
        { number: '7', label: 'Quit', action: :quit }
      ].freeze

  def initialize(app)
    @app = app
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    MENU_OPTIONS.each do |option|
      puts "#{option[:number]}. #{option[:label]}"
    end
  end

  def handle_option(option)
    selected_option = MENU_OPTIONS.find { |item| item[:number] == option }
    return exit_option if selected_option.nil?
    @app.send(selected_option[:action])
  end

  private

  def exit_option
    puts 'Thank you for using our library ¯\^-^/¯'
    exit
  end
end

class LibraryApp
  def initialize
    @app = App.new
    @menu = Menu.new(@app)
  end

  def start
    puts 'Welcome to School Library App!'
    loop do
      @menu.display_menu
      option = gets.chomp
      @menu.handle_option(option)
    end
  end

end

LibraryApp.new.start
