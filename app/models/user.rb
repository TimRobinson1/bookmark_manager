require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_encrypt, Text

  def password=(password)
    self.password_encrypt = BCrypt::Password.create(password)
  end

end
