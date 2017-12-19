greeting = ARGV.shift #Removes the first element of ARGV and returns it

ARGV.each do |name| 
    puts "#{greeting}, #{name}!"
end

greeting