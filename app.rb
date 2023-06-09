require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require 'json'

class App
  attr_accessor :peoples, :books, :rentals

  def initialize
    @peoples = []
    @books = []
    @rentals = []
    base = "#{Dir.pwd}/data"
    books_reader = File.read("#{base}/books.json")
    people_reader = File.read("#{base}/people.json")
    rentals_reader = File.read("#{base}/rentals.json")
    File.read("#{base}/people.json")
    File.read("#{base}/rentals.json")
    JSON.parse(books_reader).each { |x| @books.push(Book.new(x['title'], x['author'])) } unless books_reader == ''
    handle_people(people_reader == '' ? [] : JSON.parse(people_reader))
    handle_rentals(rentals_reader == '' ? [] : JSON.parse(rentals_reader))
  end

  def handle_people(arr)
    arr.each do |person|
      if person['person'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['specialization'], name: person['name'])
        teacher.id = person['id']
        @peoples.push(teacher)
      else
        student = Student.new(person['age'], name: person['name'], parent_permission: person['parent_permission'])
        student.id = person['id']
        @peoples.push(student)
      end
    end
  end

  def handle_rentals(arr)
    arr.each do |x|
      find_a_person = @peoples.select { |p| p.id == x['person'] }
      find_a_book = @books.select { |b| b.title == x['book'].to_s }
      @rentals.push(Rental.new(x['date'], find_a_person[0], find_a_book[0]))
    end
  end

  # create a list of BOOK
  def list_books
    if @books.empty?
      puts 'Oops! the library is empty, please add books'
      return
    end
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  # create a list of people
  def list_people
    if @peoples.empty?
      puts 'Oops! the list is empty, please add people'
      return
    end
    @peoples.each do |people|
      puts "[#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  # Create a person
  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    input_result = gets.chomp.to_i

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  # Create a student
  def create_student
    print 'Name:'
    name = gets.chomp

    print 'Age:'
    age = gets.chomp.to_i

    print 'Has Parent permission? [Y/N]'
    permission = gets.chomp
    permission = true if %w[Y y].include?(permission)
    permission = false if %w[N n].include?(permission)

    student = Student.new(age, name: name, parent_permission: permission)
    @peoples.push(student)
    puts 'Student Created Successfully'
  end

  # Create teacher
  def create_teacher
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name: name)
    @peoples.push(teacher)
    puts 'Teacher Created Successfully'
  end

  # Create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    puts 'Book created successfully'
  end

  # crete Rental
  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_id = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    @peoples.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @peoples[person_id], @books[book_id])
    puts 'Rental created successfully'
  end

  # create  Rental list
  def rental_list
    print 'ID of person:'
    person_id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == person_id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}'"
    end
  end

  def quit
    puts 'Thank you for using our library ¯\^-^/¯'
    exit
  end
end
