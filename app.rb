require_relative 'classes/student'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'classes/teacher'

class App
  attr_accessor :book, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts menu_options
    input = gets.chomp.to_i

    case input
    when 1..6 then menu_nav(input)
    when 7 then puts 'Goodbye!' && exit
    else
      puts 'Invalid input! Select a number from 1 to 7'
    end
  end

  def menu_options
    puts 'Welcome! Please enter the number of the option:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def menu_nav(input)
    case input
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    else
      puts 'Invalid input'
    end
  end

  def go_back
    print 'Press Enter to return to the menu'
    gets.chomp
    run
  end

  def list_books
    if @books.empty?
      puts 'There are no books available'
      go_back
    else
      puts 'This is the list of books available:'
      @books.each_with_index { |list, i| puts "#{i}) Title: #{list.title}, Author: #{list.author}" }
    end
    go_back
  end

  def list_people
    if @people.empty?
      puts 'There are no people available'
      go_back
    else
      puts 'This is the list of all people:'
      @people.each_with_index do |list, i|
        puts "#{i}) [#{list.class}] - Name: #{list.name}, ID: #{list.id} Age: #{list.age}"
      end
    end
    go_back
  end

  def create_person
    puts 'To create a Student (Enter 1), to create a Teacher (Enter 2):'
    input = gets.chomp.to_i

    case input
    when 1 then create_student
    when 2 then create_teacher
    else
      puts 'Invalid input'
    end
  end

  def create_student
    print 'Enter your name: '
    name = gets.chomp
    print 'Enter your age: '
    age = gets.chomp.to_i
    print 'Do you have permission from your parents? [Y/N]: '
    parent_permission = gets.chomp
    student = Student.new(age, parent_permission, name)
    @people << student
    puts "#{student.name} has been created successfully"
    go_back
  end

  def create_teacher
    print 'Enter your name: '
    name = gets.chomp
    print 'Enter your age: '
    age = gets.chomp.to_i
    print 'Enter your specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts "#{teacher.name} has been created successfully"
    go_back
  end

  def create_book
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} has been created successfully"
    go_back
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index { |list, i| puts "#{i}) Title: #{list.title}, Author: #{list.author}" }
    index = gets.chomp.to_i
    book = @books[index]
    puts 'Select a person from the following list by number: '
    @people.each_with_index do |list, i|
      puts "#{i}) [#{list.class}] - Name: #{list.name}, ID: #{list.id} Age: #{list.age}"
    end
    index = gets.chomp.to_i
    person = @people[index]
    puts 'Enter the date (DD/MM/AAAA): '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental on #{rental.date} has been created successfully"
    go_back
  end

  def list_rentals
    if @rentals.empty?
      puts 'There are no rentals available'
      go_back
    else
      puts 'Please enter ID:'
      person_id = gets.chomp.to_i
      get_rental = @rentals.select { |rental| rental.person.id == person_id }
      if get_rental.empty?
        puts 'No rentals matched with your ID'
      else
        puts "The rentals for ID #{person_id}:"
        get_rental.each do |rental|
          puts "- On #{rental.date}, #{rental.person.name} rented #{rental.book.title}"
        end
      end
    end
    go_back
  end
end
