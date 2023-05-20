require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

class App
    def initialize
        @peoples = []
        @books = []
        @rentals = []
    end

    def list_books
        if @books.empty?
            puts 'Oops! the library is empty, please add books'
            return
          end
          @books.each do |book|
            puts "Title: #{book.title}, Author: #{book.author}"
          end
    end

    def list_people
        if @peoples.empty?
            puts 'Oops! the list is empty, please add people'
            return
          end
          @peoples.each do |people|
            puts "Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
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

    student = Student.new(age, nil, name: name, parent_permission: permission)
    @peoples.push(student)
    puts 'Student Created Successfully'
  end

  # Create teacher
  def create_teacher
    print 'Name'
    name = gets.chomp

    print 'Age'
    age = gets.chomp.to_i

    print 'specialization'
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @peoples.push(teacher)
    puts 'Teacher Created Successfully'
  end

  #Create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    puts 'Book created successfully'
  end



end