require 'spec_helper'

describe "Authentication Pages" do
	subject { page }

	describe "sign in page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
	end
  
end
