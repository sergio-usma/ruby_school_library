require './person'

# Creating class Student
class Student < Person
  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classromm = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
