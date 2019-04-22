55.times do |n|
  name = Faker::Music::RockBand.name
  email = Faker::Internet.email
  password = "password"
  User.create!(user_name: name,
               email: email,
               password: password,
               password_confirmation: password,
  )
end