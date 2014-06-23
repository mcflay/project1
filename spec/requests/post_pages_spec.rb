require 'spec_helper'

describe "Post Pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "post creation" do
  	before { visit user_path }

  	describe "with invalid information" do
  		it "should not create a post" do
  			expect { click_button "Post" }.not_to change(Post, :count)
  		end

  		describe "error messages" do
  			before { click_button "Post" }
  			it { should have_content('error') }
  		end
  	end

  	describe "with valid information" do

  		before do
  		 fill_in 'post_content', with: "Lorem ipsum" 
  		 fill_in 'post_title', with: "Lorem ipsum"
  		end
  		it "should create a post" do
  			expect { click_button "Post" }.to change(Post, :count).by(1)
  		end
  	end
  end

end
