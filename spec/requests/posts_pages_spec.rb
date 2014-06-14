require 'spec_helper'

describe "post pages" do
	subject { page }

	describe "add post page" do
		before { visit '/posts/new' }
		it { should have_content('New') }
	end
end