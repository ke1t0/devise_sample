User.create!(name: "Example User",
             email: "example@test.com",
             password: "example",
             admin: true
            )

25.times do |n|
  name = Faker::Name.name
  email = "email-#{n+1}@sample.com"
  password = "password"
  User.create!(name: name, email: email, password: password)
end

users = User.order(:created_at).take(6)
30.times do
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.tweets.create!(body: body) }
end

user1 = User.first

uall = User.all
following = uall[2..10]
followers = uall[4..15]
following.each {|followed| user1.active_relationships.create(follower_id: followed.id)}
followers.each {|follower| follower.active_relationships.create(follower_id: user1.id)}