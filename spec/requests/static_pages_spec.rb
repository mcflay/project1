require 'spec_helper'

describe "StaticPages" do
  describe "home page" do
  	it "should have the content 'home'" do
  		visit root_path
  		expect(page).to have_content('Sample App')
  	end	
  end
  describe "about page" do
  	it "should have the content 'about'" do
  		visit about_path
  		expect(page).to have_content('About')
  	end
  end
  describe "help page" do
  	it "Should have the content 'help'" do
  		visit help_path
  		expect(page).to have_content('Help')
  	end
  end
  describe "contact page" do
  	it "Should have the content 'Contact'" do
  		visit contact_path
  		expect(page).to have_content('Contact')
  	end
  end
  describe "projects page" do
    it "should have the content 'Project'" do
      visit projects_path
      expect(page).to have_content('Projects')
    end
  end
end
