require_relative '../classes/student'

describe Student do
  before :each do
    @student = Student.new 'Sergio', 28, 'Math'
  end

  it 'student should inherit from person' do
    classroom = @student.classroom

    expect(classroom).to eql('Math')
    expect(@student).to be_kind_of(Person)
  end

  it 'play_hooky should return a text emoji' do
    play = @student.play_hooky

    expect(play).to eql('¯(ツ)/¯')
  end

  it 'class_room should return a classroom' do
    classroom = @student.classroom

    expect(classroom).to eql('Math')
  end
end
