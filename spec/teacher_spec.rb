require_relative 'spec_helper'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Math') }

  describe '#initialize' do
    it 'sets the age' do
      expect(teacher.age).to eq(30)
    end

    it 'sets the specialization' do
      expect(teacher.specialization).to eq('Math')
    end

    it 'sets the default name to Unknown' do
      expect(teacher.name).to eq('Unknown')
    end

    it 'sets the name' do
      teacher_with_name = Teacher.new(35, 'Science', name: 'John')
      expect(teacher_with_name.name).to eq('John')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end
end