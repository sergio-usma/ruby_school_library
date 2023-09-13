require 'json'
require 'fileutils'

class Write
  def check_file(file_name)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/books.json') unless File.exist?('./data/books.json') && file_name == 'books'
    FileUtils.touch('./data/person.json') unless File.exist?('./data/person.json') && file_name == 'person'
    FileUtils.touch('./data/rentals.json') unless File.exist?('./data/rentals.json') && file_name == 'rentals'
  end

     def store(people,books,rentals)
       write_books(books)
       write_person(people)
       write_rentals(rentals)
       puts 'All Records were saved !'
     end

  def write_books(books)
    puts 'Saving books into storage ...'
    book_data = []
    books.each do |book|
      book_data.push({
                       'title' => book.title,
                       'author' => book.author
                     })
    end
    return if book_data.empty?

    check_file('books')
    File.write('./data/books.json', JSON.pretty_generate(book_data))
  end

  def write_person(people)
    puts 'Saving people into storage ...'
    people_data = []
    people.each do |person|
      person_hash = {
        'id' => person.id,
        'type' => person.class,
        'name' => person.name,
        'age' => person.age
      }
      if person.instance_of?(Student)
        person_hash['classroom'] = person.classroom
      else
        person_hash['specialization'] = person.specialization
      end
      people_data.push(person_hash)
    end
    return if people_data.empty?

    check_file('person')
    File.write('./data/person.json', JSON.pretty_generate(people_data))
  end

  def write_rentals(rentals)
    puts 'Saving rentals into storage ...'
    rentals_data = []
    rentals.each do |rental|
      rental_hash = {
        'date' => rental.date,
        'title' => rental.book.title,
        'author' => rental.book.author,
        'id' => rental.person.id,
        'name' => rental.person.name,
        'age' => rental.person.age,
        'type' => rental.person.class
      }
      if rental.person.instance_of?(Student)
        rental_hash['classroom'] = rental.person.classroom
      else
        rental_hash['specialization'] = rental.person.specialization
      end
      rentals_data.push(rental_hash)
    end
    return if rentals_data.empty?

    check_file('rentals')
    File.write('./data/rentals.json', JSON.pretty_generate(rentals_data))
  end
end
