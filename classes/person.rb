require_relative 'book'
require_relative 'nameable'
require_relative 'rental'
require_relative 'student'

class Person < Nameable
  attr_reader :parent_permission
  attr_accessor :name, :age, :rentals, :id

  def initialize(name, age, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?(parent_permission: true)
    return false if of_age? && parent_permission

    true
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end

  private

def of_age?
  @age >= 18
end
