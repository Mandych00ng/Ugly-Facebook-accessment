require 'bcrypt'

class User < ActiveRecord::Base
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :email, uniqueness:{case_sensitive: false, message:"Bad email"} 
	validates :password, length: { in: 6..30 }
	validates :name, presence: true
	validates :email, presence: true
	
	
	has_many :statuses
	has_many :likes
	has_many :friends
	
	has_secure_password
end
