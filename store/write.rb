require 'json'

class Write
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def to_store
    write_books
    write_person
    write_rentals
    puts 'All Records were saved !'
  end

  def write_books
    puts 'Saving books into storage ...'
    book_data = []

    @books.each do |book|
      book_data.push({
                       'title' => book.title,
                       'author' => book.author
                     })
    end

    json_data = JSON.generate(book_data)
    File.write('./data/books.json', json_data)
  end

  def write_person
    puts 'Saving people into storage ...'
    people_data = []
    @people.each do |person|
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
    json_data = JSON.generate(people_data)
    File.write('./data/person.json', json_data)
  end

  def write_rentals
    puts 'Saving rentals into storage ...'
    rentals_data = []
    @rentals.each do |rental|
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
    json_data = JSON.generate(rentals_data)
    File.write('./data/rentals.json', json_data)
  end
end
