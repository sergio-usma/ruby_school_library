#!/usr/bin/env ruby
require './app'
@app = App.new

def title
  puts 'Welcome to Microverse School Library!!!'
  puts
end

def main
  title
  @app.options

  loop do
    input = gets.chomp
    case input
    when '1'
      @app.list_books
    when '2'
      @app.list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      @app.list_rentals
    else
      exit_program
    end
  end
end

def create_person
  puts 'To create a Student (Enter 1), to create a Teacher (Enter 2):'
  input = gets.chomp
  if input == '1'
    create_student
  elsif input == '2'
    create_teacher
  else
    puts 'Invalid input'
  end
end

def create_student
  print 'Enter your name: '
  name = gets.chomp
  print 'Enter your age: '
  age = gets.chomp
  print 'Enter your classroom: '
  label = gets.chomp
  print 'Do you have permission from your parents? [Y/N]: '
  permission = gets.chomp.downcase
  if permission == 'y'
    parent_permission = true
  elsif permission == 'n'
    parent_permission = false
  else
    puts 'Invalid input'
  end
  @app.create_student(age, label, parent_permission, name)
end

def create_teacher
  print 'Enter your name: '
  name = gets.chomp
  print 'Enter your age: '
  age = gets.chomp
  print 'Enter your specialization: '
  specialization = gets.chomp
  @app.create_teacher(age, specialization, name)
end

def create_book
  print 'Enter title: '
  title = gets.chomp
  print 'Enter author: '
  author = gets.chomp
  @app.create_book(title, author)
end

def create_rental
  puts 'Enter a Book´s title from the following list:'
  @app.list_books
  book_title = gets.chomp

  puts 'Enter a Person name from the following list: '
  @app.list_people
  person_name = gets.chomp

  print 'Enter the date: '
  date = gets.chomp
  @app.create_rental(date, book_title, person_name)
end

def exit_program
  puts 'Goodbye!!!'
  exit
end

main
