require './person'

# Creating class Student
class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classromm = classroom
    classroom.add_student(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
