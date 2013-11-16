namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "user@example.com",
                         username: "user",
                         password: "foobarbazqux",
                         password_confirmation: "foobarbazqux",
                         admin: true)

    99.times do |n|
      name  = Faker::Name.name
      email = "user-#{n+1}@example.com"
      username = "user#{n+1}"
      password  = "password123"
      User.create!(name: name,
                   email: email,
                   username: username,
                   password: password,
                   password_confirmation: password)
    end
  end
end
