require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
  # def add_student(age, self, name, parent_permission)
  #     student = Student.new(age, self, name, parent_permission)
  #     @students << student
  # end
end

# classroom = Classroom.new('Math')
# student1 = Student.new(11, nil, name: 'Alice')
# student2 = Student.new(14, nil, name: 'Bob')
# classroom.add_student(student1)
# classroom.add_student(student2)
# p classroom.students.map(&:age)
