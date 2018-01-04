#Call with ruby address_bloc.rb
#https://en.wikipedia.org/wiki/Exception_handling
#https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller#Advantages_&_disadvantages

require_relative '../models/address_book' #connects it to the the address_book model and the AddressBook class

class MenuController
    attr_reader :address_book # These must be accessors since we mutate them

    def initialize
        @address_book = AddressBook.new #
    end

    def main_menu
    
    #menu options on command line
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number"
    puts "6 - Exit"
    print "Enter your selection: "

    #Retrieve user input from the command line using gets, which reads the next line from standard input. 
    selection = gets.to_i

    case selection #Baby's first Ruby case statement :D
    
        when 1
            system "clear" #clears out terminal
            view_all_entries
            main_menu #back to the main menu defined above
    
        when 2
            system "clear"
            create_entry 
            main_menu
    
        when 3
            system "clear"
            search_entries 
            main_menu
    
        when 4
            system "clear"
            read_csv 
            main_menu

        when 5
            system "clear"
            entry_n_submenu
            main_menu
    
        when 6
            puts "Good-bye!"
            exit(0) #I think you can pass anything in as an argument, but 0 signifies exiting without error
    
        else
            system "clear"
            puts "Sorry, that is not a valid input"
            main_menu
        end
    end

    #Bunch of stubs

    def view_all_entries
        
        address_book.entries.each do |entry| #go through address book entries with each loop
            system "clear" #clear terminal screen
            puts entry.to_s 
            entry_submenu(entry) #calls up the submenu, defined at bottom
        end

        system "clear"
        puts "End of entries"
    end

    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        
        print "Name: "
        name = gets.chomp
        print "Phone number: " #print acts just like puts, but doesn't add a new line
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        system "clear"
        puts "New entry created"
    end

    def search_entries
        print "Search by name: " #starts with promt
        name = gets.chomp #whatever is entered minus whitespace
        # #10
        match = address_book.binary_search(name) #calls up binary_search method in addess_book, passes in name you entered
        system "clear" #clear terminal
        # #11
        if match 
          puts match.to_s #binary_search will only call up match or nil, never empty string
          search_submenu(match) #displays a list of operations that can be performed on an Entry
        else
          puts "No match found for #{name}"
        end
    end

    def read_csv
        print "Enter CSV file to import: " #prompt
        file_name = gets.chomp #whatever you enter, minus the whitespace
    
        if file_name.empty? #if nothing is entered, clears terminal screen, puts the message, returns to main menu
          system "clear"
          puts "No CSV file read"
          main_menu
        end
    
        begin #prevents program from crashing if exception is thrown
          entry_count = address_book.import_from_csv(file_name).count #import the CSV files, count the entries
          system "clear" #clear terminal
          puts "#{entry_count} new entries added from #{file_name}" #Or "#{number} added from #{file}""
        rescue #will route to this whenever exception is raised (exceptions can be called intentionally using Ruby's raise method)
          puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file" #saves your program if you mess up the file path
          read_csv #returns to beginning of method
        end
    end

    def entry_n_submenu
        print "Enter entry number:"
        selection = gets.chomp.to_i #takes number without white space
        
        if selection < @address_book.entries.count #could just as easily use length or size?
            puts @address_book.entries[selection]
            puts "Press enter to return to main menu"
            gets.chomp
            system "clear"
        else
            puts "#{selection} is not a valid input"
            main_menu #Figured this is kinder than entry_n_submenu. If you have no entries, you get stuck here forever. 
        end

    end

    def entry_submenu(entry)
        
        #submenu options
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
    
        selection = gets.chomp #pulls up whatever option, minus the trailing whitespace (.chomp)
    
        case selection
        
            when "n"
            when "d"
                delete_entry(entry)
            when "e"
                edit_entry(entry)
                entry_submenu(entry)       
            when "m"
            system "clear"
            main_menu

            else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry) #takes you back to the submenu options
        
        end
    end

    def delete_entry(entry)
        address_book.entries.delete(entry) 
        puts "#{entry.name} has been deleted"
    end

    def edit_entry(entry)
        print "Updated name: " #start with prompt
        name = gets.chomp #whatever you entered, minus whitespace
        print "Updated phone number: " 
        phone_number = gets.chomp
        print "Updated email: "
        email = gets.chomp
    
        entry.name = name if !name.empty? #use !attribute.empty? to set attributes on entry only if a valid attribute was read from user input.
        entry.phone_number = phone_number if !phone_number.empty?
        entry.email = email if !email.empty?
        system "clear"
       
        puts "Updated entry:"
        puts entry #prints entry with updated attributes
    end

    def search_submenu(entry) #needed for search_entries method, up around the 90's
        
        #submenu for the entry
        puts "\nd - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        selection = gets.chomp #save user input to selection
    
        #specific actions based on user input
        case selection
          when "d"
            system "clear"
            delete_entry(entry) #calls delete entry method
            main_menu
          when "e"
            edit_entry(entry) #calls edit entry method
            system "clear"
            main_menu
          when "m" 
            system "clear"
            main_menu #returns to main menu
          else
            system "clear"
            puts "#{selection} is not a valid input"
            puts entry.to_s 
            search_submenu(entry) #ask for entry again using search_submenu method
        end
    end

end

