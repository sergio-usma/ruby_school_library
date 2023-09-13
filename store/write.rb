require 'json'

class Write
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def to_store
    write_books
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
end
