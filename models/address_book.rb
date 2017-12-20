require_relative 'entry' #Tell Ruby to load the library named entry.rb relative to address_book.rb's file path using require_relative

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

end