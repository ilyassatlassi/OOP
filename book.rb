require_relative 'rental'
require_relative 'person'



class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, person, self)
    @rentals << rental
  end
end
