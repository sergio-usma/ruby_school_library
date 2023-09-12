require 'json'

class Read
  def read_books
    books = []
    return books unless File.exist?('./data/books.json')

    store = File.open('./data/books.json')
    book_data = JSON.parse(store.read)
    book_data.each { |book| books << (Book.new(book['title'], book['author'])) }
    store.close
    books
  end

  def read_person
    people = []
    return people unless File.exist?('./data/person.json')

    store = File.open('./data/person.json')
    people_data = JSON.parse(store.read)
    people_data.each do |person|
      if person['type'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        people << teacher
      else
        student = Student.new(person['classroom'], person['age'], person['name'])
        people << student
      end
    end
    store.close
    people
  end

  def read_rentals
    rentals = []
    return rentals unless File.exist?('./data/rentals.json')

    store = File.open('./data/rentals.json')
    rental_data = JSON.parse(store.read)
    rental_data.each do |rent|
      if rent['type'] == 'Teacher'
        teacher = Teacher.new(rent['age'], rent['specialization'], rent['name'])
        book = Book.new(rent['title'], rent['author'])
        rental = Rental.new(rent['date'], book, teacher)
      else
        student = Student.new(rent['classroom'], rent['age'], rent['name'])
        book = Book.new(rent['title'], rent['author'])
        rental = Rental.new(rent['date'], book, student)
      end
      rentals << rental
    end
    store.close
    rentals
  end
end
