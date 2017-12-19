require_relative 'entry' #Tell Ruby to load the library named entry.rb relative to  address_book.rb's file path using require_relative

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

end