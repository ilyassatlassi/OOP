require_relative 'spec_helper'

describe Student do
  let(:age) { 15 }
  let(:classroom) { Classroom.new('Math') }
  let(:name) { 'John' }
  let(:parent_permission) { true }
  let(:student) { Student.new(age, classroom: classroom, name: name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'sets the age, classroom, name, and parent_permission' do
      expect(student.age).to eq(age)
      expect(student.classroom).to eq(classroom)
      expect(student.name).to eq(name)
    end
  end

  describe '#play_hooky' do
    it 'returns the correct string' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'assigns the classroom and adds the student to the classroom' do
      new_classroom = Classroom.new('Science')
      student.classroom = new_classroom

      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end

    it 'does not add the student to the classroom if already present' do
      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
      expect(classroom.students.count(student)).to eq(1)

      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
