class User < ApplicationRecord 
  has_secure_password
  has_many :listings, dependent: :destroy

  validates :first_name, :last_name, :email, :phone_number, :age, :occupation, :bio, :username, presence: true
  
  # def password=(new_password)
  #   salt = BCrypt::Engine::generate_salt
  #   hashed = BCrypt::Engine::hash_secret(new_password, salt)
  #   self.password_digest = salt + hashed
  # end

  # def authenticate(password)
  #   salt = password_digest[0..28]
  #   hashed = BCrypt::Engine::hash_secret(password, salt)
  #   return nil unless (salt + hashed) == self.password_digest
  # end

  
  def name_to_s
    self.first_name + ' ' + self.last_name
  end

end
