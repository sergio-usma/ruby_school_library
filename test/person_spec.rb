require_relative '../classes/person'

describe Person do
  before :each do
    @person = Person.new('Bruno', 25)
  end

  it 'Should include a name equal to "Bruno" ' do
    expect(@person.name).to eql('Bruno')
  end

  it 'Should include an age equal to 25 ' do
    expect(@person.age).to eql(25)
  end

  it 'Should include parent permisson as true' do
    expect(@person.parent_permission).to eql(true)
  end

  it 'Rentals should be an empy array' do
    actual = @person.rentals

    expect(actual).to eql([])
  end

  it 'Should be an instance of Person' do
    expect(@person).to be_an_instance_of(Person)
  end
end
