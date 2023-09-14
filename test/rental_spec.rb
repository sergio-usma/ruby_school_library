require_relative '../classes/rental'
require_relative '../classes/book'
require_relative '../classes/person'

describe Rental do
  before :each do 
    @date = '2015/08/25'
    @book = Book.new('Unknow Book', 'Unkow author')
    @person = Person.new('Bruno',25)
    @rental = Rental.new(@date, @book, @person)
  end

  it 'Should include date: 2015/08/25' do
    actual = @rental.date
    expect(actual).to eql('2015/08/25')
  end
  it 'Should include a book' do
    actual = @rental.book
    expect(actual).to be(@book)
  end
  it 'Should include a person' do
    actual = @rental.person
    expect(actual).to be(@person)
  end
  it 'Should be referenced inside book.rentals' do
    actual = @rental.book.rentals
    expect(actual).to include(@rental)
  end
  it 'Should be referenced inside person.rentals' do
    actual = @rental.person.rentals
    expect(actual).to include(@rental)
  end
end