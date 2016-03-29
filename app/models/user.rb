class User < ActiveRecord::Base
	has_secure_password

	before_save { |user| user.email = user.email.upcase }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w+\.-]+\.[a-z]{2,}\z/i
	
	validates :name, presence: true, length: { maximum: 50}
	validates :email, uniqueness: { case_sensitive: false }, presence: true
	validates_format_of :email, :with => VALID_EMAIL_REGEX
	validates :password, presence: true, length: {minimum: 6}
	validates :password_confirmation, presence: true
end
