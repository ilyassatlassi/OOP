require 'fileutils'
require 'json'

FileUtils.mkdir_p('data')
base = "#{Dir.pwd}/data"
File.open("#{base}/books.json", 'w') unless File.exist?("#{base}/books.json")
File.open("#{base}/people.json", 'w') unless File.exist?("#{base}/people.json")
File.open("#{base}/rentals.json", 'w') unless File.exist?("#{base}/rentals.json")

