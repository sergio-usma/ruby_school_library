class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end

person1 = Person.new(15, name: 'Juan', parent_permission: false)
puts person1.can_use_services?

person2 = Person.new(48, name: 'David')
puts person2.can_use_services?
