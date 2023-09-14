require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/person'
require_relative '../classes/rental'

describe Book do
  before :each do
    @new_book = Book.new('Test', 'Test')
  end

  it 'Inserted data should match attributes' do
    title = @new_book.title
    author = @new_book.author

    expect(title).to eql 'Test'
    expect(author).to eql 'Test'
  end

  it 'Rental instance should be created' do
    new_person = Person.new('Diego', 34)
    expect_obj = @new_book.add_rental('12/11/2023', new_person)

    expect(expect_obj).to be_instance_of(Rental)
  end
end
