require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

person1 = Person.new(15, name: 'Juan', parent_permission: false)
puts person1.can_use_services?

person2 = Person.new(48, name: 'David')
puts person2.can_use_services?

puts person1.correct_name
puts person2.correct_name

person3 = Person.new(22, name: 'maximilianus')
person3.correct_name
capitalized_person3 = CapitalizeDecorator.new(person3)
puts capitalized_person3.correct_name
capitalized_trimmed_person3 = TrimmerDecorator.new(capitalized_person3)
puts capitalized_trimmed_person3.correct_name
