User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             encrypted_password: "foobar")

25.times do |n|
  name = Faker::Name.name
  email = "email-#{n+1}@sample.com"
  password = "password"
  User.create!(name: name, email: email, password: password, encrypted_password: password)
end

users = User.order(:created_at).take(6)
50.times do
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.tweets.create!(body: body) }
end