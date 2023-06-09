require 'fileutils'
require 'json'

FileUtils.mkdir_p('data')
base = "#{Dir.pwd}/data"
File.open("#{base}/books.json", 'w') unless File.exist?("#{base}/books.json")
File.open("#{base}/people.json", 'w') unless File.exist?("#{base}/people.json")
File.open("#{base}/rentals.json", 'w') unless File.exist?("#{base}/rentals.json")

def save_rentals(array)
  base = "#{Dir.pwd}/data"
  empty_array = []
  array.each { |e| empty_array.push({ date: e.date, book: e.book.title, person: e.person.id }) }
  File.write("#{base}/rentals.json", empty_array.to_json, mode: 'w')
end

def save_books(array)
  base = "#{Dir.pwd}/data"
  books_array = array.map { |e| { title: e.title, author: e.author } }
  File.write("#{base}/books.json", books_array.to_json, mode: 'w')
end

def save_people(array)
  base = "#{Dir.pwd}/data"
  empty_array = []
  array.each do |e|
    empty_array.push({
                       person: e.class,
                       name: e.name,
                       specialization: (e.instance_of?(Teacher) ? e.specialization : nil),
                       id: e.id,
                       age: e.age
                     })
  end
  File.write("#{base}/people.json", empty_array.to_json, mode: 'w')
end
