require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'teacher'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, classroom, parent_permission: true, type: 'Student')
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    @type = type
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def class_room=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
