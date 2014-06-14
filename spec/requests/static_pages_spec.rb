require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "home page" do
    before { visit root_path }
    it { should have_content('Sample App') }
  end

  describe "about page" do
    before { visit about_path }
    it { should have_content('About') }
  end

  describe "contact page" do
    before { visit contact_path }
    it { should have_content('Contact') }
  end

  describe "projects page" do
    before { visit projects_path }
    it { should have_content('Projects') }
  end

  describe "help page" do
    before { visit help_path }
    it { should have_content('Help') }
  end
end

