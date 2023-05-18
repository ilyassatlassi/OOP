require_relative 'Student'

class Classroom
    attr_accessor :labbel
    def initialize(label)
        @label = label
    end
end