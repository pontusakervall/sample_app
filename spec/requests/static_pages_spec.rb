require 'rails_helper'

=begin
RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      get static_pages_index_path
      expect(response).to have_http_status(200)
    end
  end
end
=end

describe "StaticPages" do
	describe "Home Page" do
		it "should have the content 'Sample App'" do
			visit root_path
			#page.should have_content('Sample App')
			page.should have_selector('h1', text: 'Sample App')
		end

		it "should have the right title" do
			visit root_path
			page.should have_title('Sample App | Home')
		end
	end

	describe "Help Page" do
		it "should have the content 'Help" do
			visit help_path
			#page.should have_content('Help')
			page.should have_selector('h1', text: 'Help')
		end

		it "should have the right title" do
			visit help_path
			page.should have_title('Sample App | Help')
		end
	end

	describe "About Page" do
		it "should have the content 'About Us" do
			visit about_path
			#page.should have_content('About Us')
			page.should have_selector('h1', text: 'About Us')
		end

		it "should have the right title" do
			visit about_path
			page.should have_title('Sample App | About Us')
		end
	end

	describe "Contact Page" do
		it "should have the content 'Contact" do
			visit contact_path
			page.should have_selector('h1', text: 'Contact')
		end

		it "should have the right title" do
			visit contact_path
			page.should have_title('Sample App | Contact')
		end
	end

end