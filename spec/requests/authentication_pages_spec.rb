require 'rails_helper'

describe "Authentication pages" do
	subject { page }

	describe "sign in page" do
		before { visit signin_path }
		
		it { should have_selector('h1', text: 'Sign in') }
		it { should have_title('Sample App | Sign in') }
	end
end
