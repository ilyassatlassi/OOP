require_relative 'decorator'

class TrimmerDecorator 
    def correct_name
        if @name.length > 10
            @name[0..9]
          else
            @name
          end
        end
end
