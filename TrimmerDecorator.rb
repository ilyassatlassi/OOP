require_relative 'decorator'

class TrimmerDecorator < Decorator
    def correct_name
        if super().length > 10
            super()[0..9]
          else
            super()
          end
        end
end
