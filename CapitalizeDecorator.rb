
require_relative 'decorator'

class CapitalizeDecorator < decorator
    def correct_name
        @nameable.correct_name.capitalize
  end
end
