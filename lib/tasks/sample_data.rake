require 'date'

      # You can add whatever you want to the locale file, and it will get caught here.
      # E.g., in your locale file, create a
      #   name:
      #     girls_name: ["Alice", "Cheryl", "Tatiana"]
      # Then you can call Faker::Name.girls_name and it will act like #first_name


namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "Example User", email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar", admin: true)
		10.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name: name, email: email, password: password, password_confirmation: password)
		end
		users = User.all(limit: 6)
		30.times do 
			content = Faker::Bento.bento
			date = Date.today
			users.each { |user| user.boxes.create!(content: content) }
		end

	end
end
