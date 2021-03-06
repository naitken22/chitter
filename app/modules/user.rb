require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader 	:password
	attr_accessor :password_confirmation
	validates_confirmation_of :password

	property :id, 							Serial
	property :name,							String
	property :email,						String, unique: true, message: "This email is already taken" 
	property :handle,						String, unique: true, message: "This username is already taken"
	property :password_digest,	Text

	has n,	 :peeps

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(handle, password)
		user = first(handle: handle)
		if user && BCrypt::Password.new(user.password_digest) == password
			user 
		else
			nil
		end
	end

end