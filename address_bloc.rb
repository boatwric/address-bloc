require_relative 'controllers/menu_controller' #links it to the menu when it app boots

menu = MenuController.new #create a new menu whenever app starts

system "clear" #clears the command line

puts "Welcome to AddressBloc!"

menu.main_menu #invokes menu, and since menu is tied to MenuController it can call the main menu function nested there to display menu