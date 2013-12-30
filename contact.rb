class Contact
  
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :phonenumber
  
  def initialize(name, email, *phonenumber = 0)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
  
  def to_s
    # TODO: return string representation of Contact
  end
  
end