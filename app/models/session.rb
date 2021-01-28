class Session < ApplicationRecord
  validates :username, :password, presence: true

end