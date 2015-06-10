require 'pg'
require 'pry'

# This file connects to the database to alter/ input/ output it using SQL.

puts "Starting connection..."

begin
  $conn = PG::Connection.new(
    host: 'ec2-54-83-57-86.compute-1.amazonaws.com',
    port: 5432,
    password: 'W9OzMShqF-EbEhy6GvnGLYy5sp',
    user: 'jqtebrmxavvhxd',
    dbname: 'd6495ci9e5vdnu'
  )
rescue PG::ConnectionBad
  puts "Sorry! There is something wrong with your credentials."
end

puts "Connected to database"