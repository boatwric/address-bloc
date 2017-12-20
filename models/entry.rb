class Entry

    attr_accessor :name, :phone_number, :email # These must be accessors since we mutate them

    def initialize(name, phone_number, email)
        @name = name
        @phone_number = phone_number
        @email = email
    end

    def to_s
        "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}" #creates the rspec string needed
    end

end

#stub= piece of code used to stand in for some other programming functionality