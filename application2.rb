class Application 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
  end

  def run
    show_main_menu
    input = gets.chomp.downcase

    case input
    when "quit"
      puts "Thanks for using contact machine!"
      exit
    when "new"
      test = Contact.create
      puts "Type First Name"
      test.first_name = gets.chomp
      puts "Type Last Name"  
      test.last_name = gets.chomp
      puts "Type Email"
      test.email = gets.chomp
      puts "Type Importance Score (1-5)"
      test.importance = gets.chomp
      test.save
    when "list"
      i = 0
      Contact.all.each do |x|
        puts "<#{i}> <#{x.first_name} #{x.last_name}> <#{x.email}> <#{x.importance}>"
        i = i + 1
      end
      run
    when "show"
      puts "Please enter the ID of the contact you're looking for"
      id = gets.chomp 
      contact = Contact.find(id)
      puts contact.first_name
      puts contact.last_name
      puts contact.email 
      run
    when "delete"
      puts "Please enter the ID of the contact you're looking to delete"
      id = gets.chomp
      contact = Contact.delete(id)
    when "test"
     Contact.where(importance: 5).each do |test|
      puts test.first_name
    end
     
    else
      puts "Sorry, I don't recognize that command. Please try again."
      run
    end
  end

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new                    - Create a new contact"
    puts " list                   - List all contacts"
    puts " show :id               - Display contact details"
    puts " quit                   - Quits out of the application"
    puts " edit (name,email)      - Edit the name or email of a contact"
    puts " delete (id)            - Delete the contact"
    print "> "
  end

  #checks for doubles in the current contact database
  def check_doubles(email)
   if Contact.any? {|x| x.include? "#{email}"} == true
      puts "that contact already exists, please try again"
      run
    else 
      puts "Please enter the contact's full name"
      name = gets.chomp.downcase
      Contact.new << [name,email]
      puts "Contact has been saved!"
      run
    end
  end

def edit_contact(edit_decision, i)
   case edit_decision
   when "y"
    puts "please type the new name"
    name = gets.chomp
    puts "please type the new email"
    email = gets.chomp
    Contact[i] = [name, email]
    puts "contact saved!"
    puts Contact[i]
  when "n"
    puts "moving on!"
  else
    run
  end
end



end