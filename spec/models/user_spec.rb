require 'rails_helper'
=begin

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
=end

describe User do

	before { @user = User.new(name: "Example Usher", email: "usher@example.com",
	 password: "foobar", password_confirmation: "foobar")}

	subject { @user }

	it { should respond_to(:name)}
	it { should respond_to(:email)}
	it { should respond_to (:password_digest)}
	it { should respond_to (:password)}
	it { should respond_to (:password_confirmation)}

	describe "name too long" do
		before {@user.name = "a" * 51}
		it { should_not be_valid}
	end

	describe "email format invalid" do
		it "should be invalid" do
			addresses = %w[usher@foo,com usher_at_foo.com usher@foo.]
			addresses.each do |invalid_address| 
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[usher@foo.com U_SH-ER@f.oo.com us.her@foo.com us+her@foo.com]
			addresses.each do |valid_adress|
				@user.email = valid_adress
				@user.should be_valid
			end
		end
	end

	describe "when email is taken" do
		before do
			same_user = @user.dup
			same_user.email = @user.email.upcase
			same_user.save
		end

		it { should_not be_valid}
	end

	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " "}
		it {should_not be_valid}
	end

	describe "when password doesn't match password_confirmation" do
		before { @user.password_confirmation = "bad-password"}
		it {should_not be_valid}
	end

	describe "when password confirmation is nil" do
		before { @user.password_confirmation = nil}
		it {should_not be_valid}
	end
end