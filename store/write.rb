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
    puts "All Records were saved !"
  end

  def write_books
    puts "Saving books into storage ..."
    book_data = []

    @books.each { | book |
      book_data.push({
        'title' => book.title,
        'author' => book.author
      })
    }

    json_data = JSON.generate(book_data)
    store = File.open('./data/books.json', "w") { | file |
      file.write json_data
    }
  end

  def write_person
    puts "Saving people into storage ..."
    people_data = []
    @people.each { | person |
      person_hash = {
        'id' => person.id,
        'type' => person.class,
        'name' => person.name,
        'age' => person.age,
      }
      if person.class == Student
          person_hash['classroom'] = person.classroom
      else
        person_hash['specialization'] = person.specialization
      end
      people_data.push(person_hash)
    }
    json_data = JSON.generate(people_data)
    store = File.open('./data/person.json', 'w') { | file |
      file.write json_data
    }
  end

  def write_rentals
    puts "Saving rentals into storage ..."
    rentals_data = []
    @rentals.each { | rental | 
      rental_hash = {
        'date' => rental.date,
        'title' => rental.book.title,
        'author' => rental.book.author,
        'id' => rental.person.id,
        'name' => rental.person.name,
        'age' => rental.person.age,
        'type' => rental.person.class,
      }
      if rental.person.class == Student
        rental_hash['classroom'] = rental.person.classroom
      else
        rental_hash['specialization'] = rental.person.specialization
      end
      rentals_data.push(rental_hash)
    }
    json_data = JSON.generate(rentals_data)
    store = File.open('./data/rentals.json', 'w') { | file |
      file.write json_data
    }
  end

end
