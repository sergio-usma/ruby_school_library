require_relative '../classes/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new 'Ana', 56, 'Math'
  end

  it 'Should inherit from person' do
    expect(@teacher).to be_kind_of(Person)
  end

  it 'specialization should return inserted data' do
    spec = @teacher.specialization

    expect(spec).to eql('Math')
  end

  it 'can_use_services? should always return false' do
    can_use = @teacher.can_use_services?

    expect(can_use).to eql(false)
  end
end