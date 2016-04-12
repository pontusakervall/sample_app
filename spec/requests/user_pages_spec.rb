require 'rails_helper'

=begin
RSpec.describe "UserPages", type: :request do
  describe "GET /user_pages" do
    it "works! (now write some real specs)" do
      get user_pages_index_path
      expect(response).to have_http_status(200)
    end
  end
=end

describe "User pages" do
	subject { page }

	describe "sign up page" do
		before { visit signup_path }
		
		it { should have_selector('h1', text: 'Sign up') }
		it { should have_title('Sample App | Sign up')}
	end
end

describe "signup" do
	before {visit signup_path}

	describe "with invalid information" do
		it "should not create a user" do
			old_user_count = User.count
			click_button "Create account"
			new_user_count = User.count
			new_user_count.should == old_user_count
		end
	end

	describe "with valid information" do
		it "should create a user" do
			old_user_count = User.count
			fill_in "Name", with: "Example"
			fill_in "Email", with: "pontus@gmail.com"
			fill_in "Password", with: "hejhej123"
			fill_in "Confirm password", with: "hejhej123"
			click_button "Create account"
			new_user_count = User.count
			new_user_count.should == old_user_count + 1
		end
	end
end



