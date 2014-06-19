namespace :db do
	desc "Fill database with sample date"
	task populate: :environment do
		User.create!(name: "Example User",
					email: "example@ex.com",
					password: "foobar",
					password_confirmation: "foobar",
					admin: true)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@ex.com"
			password = "password"
			User.create!(name: name,
						email: email,
						password: password,
						password_confirmation: password)
		end
	end
end