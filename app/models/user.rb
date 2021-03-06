class User < ActiveRecord::Base
  before_save { email.downcase! }

  validates :name, presence: true, 
                   length: { minimum: 2, maximum: 50 }, 
                   uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, length: { minimum: 6, maxmum: 64 }
end
