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

		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(10)
			title = Faker::Lorem.sentence(5)
			users.each { |user| user.posts.create!(content: content, title: title) }
		end
	end
end