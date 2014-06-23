require 'spec_helper'

describe Post do
  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(title: "Lorem", content: "lorem ipsum") }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  describe "when user_id is not present" do
  	before { @post.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when title is blank" do
  	before { @post.title = " " }
  	it { should_not be_valid }
  end

  describe "when title is too long" do
  	before { @post.title = "a" * 141 }
  	it { should_not be_valid }
  end

  describe "when content is blank" do
  	before { @post.content = " " }
  	it { should_not be_valid }
  end
end
