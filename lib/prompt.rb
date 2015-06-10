require_relative 'main'
require_relative 'contact'
require 'pry'

def list
  contacts = Contact.all
  contacts.each do |contact|
    puts "ID: #{contact.id} Full Name: #{contact.full_name} || Email: #{contact.email}"
  end
end

def create
  print "Enter first name:"
  first_name = gets.chomp
  print "Enter last name:"
  last_name = gets.chomp
  print "Enter email:"
  email = gets.chomp

  contact = Contact.new(nil, first_name, last_name, email)
  contact.save
  print "Your new contact has been saved!"
end

def search
  print "What would you like to search by? First name, last name, or id?"
  filter = gets.chomp.downcase

  if filter == "first name"
    print "What is the first name?"
    first_name = gets.chomp

    contacts = Contact.search_firstname(first_name)
    contacts.each do |contact|
      puts "ID: #{contact.id} Full Name: #{contact.full_name}"
    end

  elsif filter == "last name"
    print "What is the last name?"
    last_name = gets.chomp

    contacts = Contact.search_lastname(last_name)
    contacts.each do |contact|
      puts "ID: #{contact.id} Full Name: #{contact.full_name}"
    end

  elsif filter == "id"
    print "What is the ID?"
    id = gets.chomp

    contacts = Contact.search_id(id)
    contacts.each do |contact|
      puts "ID: #{contact.id} Full Name: #{contact.full_name}"
    end

  else
    print "Oops! Please check your spelling! "
    search
  end
end

puts "Contact List App"

loop do
  print %q(
    Menu

    list - show all contacts
    create - create a new contact
    search - find a contact by first name
    update - update contact
    quit - close program
    >)

command = gets.chomp

case command.downcase
  when "list"
    list
  when "create"
    create
  when "search"
    search
  when "update"
    update
  when quit
    puts "Disconnecting..."
    $conn.close
    break
  end
end