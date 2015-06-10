require 'pg'

class Contact

  attr_accessor :id, :first_name, :last_name, :email

  def initialize(id, first_name, last_name, email)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def save
    result = $conn.exec_params("INSERT INTO contacts(first_name, last_name, email) VALUES ('#{first_name}', '#{last_name}', '#{email}');")
  end

  def self.all
    result = $conn.exec_params('SELECT * FROM contacts;')
    to_array(result)
  end

  def self.search_firstname(first_name)
    result = $conn.exec_params("SELECT * FROM contacts WHERE first_name = $1", [first_name])
  end

  def self.search_lastname(last_name)
    result = $conn.exec_params("SELECT * FROM contacts WHERE last_name = $1", [last_name])
  end

  def self.search_id(id)
    result = $conn.exec_params("SELECT * FROM contacts WHERE id = $1", [id])
    to_array(result)
  end

  private
  def self.to_array(result)
    resultarray = []
    result.each do |row|
      # row {"id"=>"1213", "last_name"=>"Brookins", "first_name"=>"Andrew"}
      resultarray << Contact.new(row["id"], row["first_name"], row["last_name"], row["email"])
    end
    resultarray
  end
end