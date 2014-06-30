require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "home page" do
    before { visit root_path }
    it { should have_content('Sample App') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:post, user: user, title: "Lorem ipsum", content: "Dolor sit amet")
        FactoryGirl.create(:post, user: user, title: "Foobar", content: "Lorem ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
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

