require 'spec_helper'

describe "StaticPages" do
  describe "home page" do
  	it "should have the content 'home'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Sample App')
  	end	
  end
  describe "about page" do
  	it "should have the content 'about'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About')
  	end
  end
  describe "help page" do
  	it "Should have the content 'help'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end
  end
  describe "contact page" do
  	it "Should have the content 'Contact'" do
  		visit '/static_pages/contact'
  		expect(page).to have_content('Contact')
  	end
  end
end
