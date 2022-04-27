class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id       = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role]
  end

  def password_match?(password_check)
    @password == password_check # true / false
  end

  def manager?
    @role == "manager"
  end
end
