require_relative 'app'
require './store_data'

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
    
    if selected_option.nil?
      return exit_option
    elsif selected_option[:number] == 4
      @app.send(selected_option[:action])
      save_books(@app.books)
    elsif selected_option[:number] == 3
      @app.send(selected_option[:action])
      save_people(@app.peoples)
    elsif selected_option[:number] == 5
      @app.send(selected_option[:action])
      save_rentals(@app.rentals)
    else
      @app.send(selected_option[:action])
    end
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
