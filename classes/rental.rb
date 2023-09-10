require_relative 'book'

class Rental
  attr_accessor :date, :person, :book
  attr_reader :rentals

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end
