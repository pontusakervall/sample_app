class User < ActiveRecord::Base
	has_secure_password

	before_save { |user| user.email = user.email.downcase }
	before_save :create_remember_token
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\.-]+\.[a-z]{2,}\z/i

	validates :name, presence: true, length: { maximum: 50}
	validates :email, uniqueness: { case_sensitive: false }, presence: true
	validates_format_of :email, :with => VALID_EMAIL_REGEX
	validates :password, length: {minimum: 6}
	validates :password_confirmation, presence: true

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
