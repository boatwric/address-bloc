#http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html#method-c-new
#https://ruby-doc.org/core-2.2.2/Hash.html

require_relative 'entry' #Tell Ruby to load the library named entry.rb relative to address_book.rb's file path using require_relative
require "csv"

class AddressBook
 
    attr_accessor :entries

    def initialize 
        @entries = []
    end

    def add_entry(name, phone_number, email)
        index = 0 #Create a variable to store the insertion index
        entries.each do |entry|
            if name < entry.name #Compare name with the name of the current entry. If name lexicographically proceeds entry.name, insert at this index. Otherwise increment index and continue comparing
                break
            end
            index+= 1
        end
        entries.insert(index, Entry.new(name, phone_number, email)) #nsert a new entry into entries using the calculated `index.
    end

    def remove_entry(name, phone_number, email)
        entries.each do |entry| #go through each item in the entries array and compare to each entry
            if name == entry.name #if the name entered equals name in entry.... shouldn't that be enough?
                entries.remove(index, Entry.new(name, phone_number, email))#remove that entry from the list of entries
            end
        end
    end

    def import_from_csv(file_name)
        csv_text = File.read(file_name) #File.read is a command that just reads whatever file is passed in
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true) #csv is a object created by calling the CSV class and asking it to seperate (parse) the information by taking the text present in the csv_text variable and telling it that the first line will be used as headers and to skip over any blank content
    
        csv.each do |row| #each loop that....
          row_hash = row.to_hash #takes each row and turns it to hash, a dictionary-like object that stores keys and their values....
          add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"]) #then fills those rows with add_entry method above, taking each name/phone_number/email value and putting them into their respective rows
        end   
    end    
        
end