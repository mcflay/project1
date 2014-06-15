require 'spec_helper'

describe User do
  before { @user = User.new(name: "lorem ipsum", email:"example@sda.com",
  							password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end

  #ADD EMAIL VALIDATION TEST!!!
  
  describe "when email address is already taken" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end
  	it { should_not be_valid }
  end

  describe "when password is not preset" do
  	before do
  		@user = User.new(name: "Example user", email: "user@example.com",
  						password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

  describe "when password_confirmation is wrong" do
  	before { @user.password_confirmation = "wrong" }
  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do
  	before { @user.save }
  	let(:found_user) { User.find_by(email: @user.email) }

  	describe "with valid password" do
  		it { should eq found_user.authenticate(@user.password) }
  	end

  	describe "with invalid password" do
  		let(:user_with_invalid_password) { found_user.authenticate("invalid") }

  		it {should_not eq user_with_invalid_password }
  		specify { expect(user_with_invalid_password).to be_false }
  	end
  end

  describe "with password too short" do
  	before { @user.password = @user.password_confirmation = "a" * 5 }
  	it { should_not be_valid }
  end


end
