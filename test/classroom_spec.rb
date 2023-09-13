require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  before :each do
    @classroom = Classroom.new("Grade 7")
  end
  it 'Should return Grade 7' do
    actual = @classroom.label
    expect(actual).to eql('Grade 7')
  end

  it 'Should Initialize students as an empty array' do
    actual = @classroom.students 
    expect(actual).to eql([])
  end

  it 'Should add a new student' do
    @student = double('student')
    allow(@student).to receive(:name){'Bruno'}
    allow(@student).to receive(:classroom=)

    @classroom.add_student(@student)
    actual = @classroom.students
    expect(actual).to include(@student)
  end
end
