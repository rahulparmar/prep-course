class Application 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = [["Rahul Parmar", "rahul.parmar@gmail.com"],["Linnaea Mancini", "linnaea.mancini@gmail.com"]]
  end

  def run
    show_main_menu
    input = gets.chomp.downcase

    case input
    when "quit"
      puts "Thanks for using contact machine!"
      exit
    when "new"
      puts "Please enter the contact's email address"
      email = gets.chomp.downcase
      check_doubles(email)
    when "list"
      i = 0
      @contacts.each do |x,y|
        puts "#{i}: <#{x}> (#{y})"
        i = i + 1
      end
      run
    when "show"
      puts "Enter contact ID"
      i = gets.chomp.to_i
      if @contacts[i] == nil
        puts "Not found"
      else
       puts @contacts[i]
       puts "would you like to edit the selected contact? (Y/N)"
       edit_decision = gets.chomp.downcase
       edit_contact(edit_decision, i)
      end
      run
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
    print "> "
  end

  #checks for doubles in the current contact database
  def check_doubles(email)
   if @contacts.any? {|x| x.include? "#{email}"} == true
      puts "that contact already exists, please try again"
      run
    else 
      puts "Please enter the contact's full name"
      name = gets.chomp.downcase
      @contacts << [name,email]
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
    @contacts[i] = [name, email]
    puts "contact saved!"
    puts @contacts[i]
  when "n"
    puts "moving on!"
  else
    run
  end
end



end