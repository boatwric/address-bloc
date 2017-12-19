require_relative '../models/entry' #Ruby tries to load library named string relative to the requiring file’s path. If file’s path not determined, LoadError is raised. We'll use require_relative whenever we need to load our own project files. 

RSpec.describe Entry do #Standard first line of RSpec test file. Says that file is a spec file and that it tests Entry.
    
    describe "attributes" do #Use describe to give our test structure. In this case, we're using it to communicate that the specs test the Entry attributes.
        let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') } #Instead of hard coding a case to test, you can just pass in your entry here at the top. NEAT!!!

        it "responds to name" do #Separate individual tests using the it method. Each it represents a unique test
            expect(entry).to respond_to(:name)
        end

        it "reports its name" do
            expect(entry.name).to eq('Ada Lovelace')
        end
        
        it "responds to phone number" do
            expect(entry).to respond_to(:phone_number)
        end    

        it "reports its phone_number" do
            expect(entry.phone_number).to eq('010.012.1815')
        end
        
        it "responds to email" do
            expect(entry).to respond_to(:email)
        end

        it "reports its email" do
            expect(entry.email).to eq('augusta.king@lovelace.com')
        end

    end

    describe "#to_s" do #Need a method to return a string representation of an Entry, to be displayed in the terminal. It's standard convention to name such a method  to_s, short for "(convert) to string". Use a new describe block to separate the to_s test from the initializer tests. The # in front of to_s indicates that it is an INSTANCE METHOD
        
        it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
            expect(entry.to_s).to eq(expected_string)
        end
    
    end

end