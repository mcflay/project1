FactoryGirl.define do
	factory :user do
		name "Gal Anonim"
		email "gal@anonim.com"
		password "foobar"
		password_confirmation "foobar"
	end
end