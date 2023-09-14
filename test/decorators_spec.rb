require_relative '../classes/nameable'
require_relative '../classes/base_decorator'
require_relative '../classes/capitalize_decorator'
require_relative '../classes/trimmer_decorator'
require_relative '../classes/person'

describe Nameable do
  it 'Should raise NotImplementedError' do
    @nameable = Nameable.new
    # we use here {} instead of () because we are testing an error.
    expect { @nameable.correct_name }.to raise_error(NotImplementedError)
  end
end

describe BaseDecorator do
  it 'Should raise an error when BaseDecorator.correct_name' do
    @base_decorator = BaseDecorator.new(Nameable.new)
    expect { @base_decorator.correct_name }.to raise_error(NotImplementedError)
  end
end

describe CapitalizeDecorator do
  it 'should return Bruno' do
    @person = Person.new('maximilianus', 22)
    @capitalized_person = CapitalizeDecorator.new(@person)
    @capitalized_name = @capitalized_person.correct_name

    expect(@capitalized_name).to eql('Maximilianus')
  end
end

describe TrimmerDecorator do
  it 'should return Brunov from bruno v' do
    @person = Person.new('maximilianus', 22)
    @trimed_person = TrimmerDecorator.new(@person)
    @trimed_name = @trimed_person.correct_name
    expect(@trimed_name).to eql('maximilian')
  end
end
