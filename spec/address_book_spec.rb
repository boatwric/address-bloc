require_relative '../models/address_book' #tells it this is the file you're testing
 
RSpec.describe AddressBook do #describes the AddressBook class created in address_book.rb
  
    let(:book) { AddressBook.new } #Can get rid of all those lines that say book = AddressBook.new. Better than creating an @book instance variable and wrapping it in a before do for a number of debugging reasons. 

    def check_entry(entry, expected_name, expected_number, expected_email) #method takes entry and checks it against three other arguments
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
       
    describe "attributes" do
    
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
    
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end

    describe "#add_entry" do #add_entry has a hash because it runs when entry is initialized 

        it "adds only one entry to the address book" do
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          expect(book.entries.size).to eq(1)
        end
    
        it "adds the correct information to entries" do
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          new_entry = book.entries[0]
          expect(new_entry.name).to eq('Ada Lovelace')
          expect(new_entry.phone_number).to eq('010.012.1815')
          expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end

    describe "#remove_entry" do
        
        it "removes an entry from the address book" do
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(0)
        end
    end

    # Test that AddressBook's .import_from_csv() method is working as expected
    
    describe "#import_from_csv" do
        
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv") #I presume import_from_csv is the function that needs building, and "entries.csv" is the file
            book_size = book.entries.size 
            expect(book_size).to eq 5 #gonna have five entries in this file
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[0]
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        end
    
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            entry_two = book.entries[1]
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        end
          
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            entry_three = book.entries[2]
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        end
        
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            entry_four = book.entries[3]
            check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
        end
        
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            entry_five = book.entries[4]
            check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
    end

    describe "#import_from_csv_2" do

        it "imports the correct number of entries" do
            book.import_from_csv("entries_2.csv") #I presume import_from_csv is the function that needs building, and "entries.csv" is the file
            book_size = book.entries.size 
            expect(book_size).to eq 3 #gonna have three entries in this file
        end

        it "imports the 1st entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[0]
            check_entry(entry_one, "Chris", "555-555-3217", "Chris@somemail.com")
        end
    
        it "imports the 2nd entry" do
            book.import_from_csv("entries_2.csv")
            entry_two = book.entries[1]
            check_entry(entry_two, "Diane", "555-555-0093", "Diane@somemail.com")
        end
          
        it "imports the 3rd entry" do
            book.import_from_csv("entries_2.csv")
            entry_three = book.entries[2]
            check_entry(entry_three, "Ennui", "Doggies don't have phones", "Doggies don't have email")
        end
    end
    
end