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
            view_all_entries #not yet defined, just a stub at the bottom
            main_menu #back to the main menu defined above
    
        when 2
            system "clear"
            create_entry #not yet defined, just a stub at the bottom
            main_menu
    
        when 3
            system "clear"
            search_entries #not yet defined, just a stub at the bottom
            main_menu
    
        when 4
            system "clear"
            read_csv #not yet defined, just a stub at the bottom
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
    end

    def read_csv
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
            
            #bunch of case stubs that do nothing at the moment
            when "n"
            when "d"
            when "e"
            when "m"
            system "clear"
            main_menu

            else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry) #takes you back to the submenu options
        
        end
    
    end

end

