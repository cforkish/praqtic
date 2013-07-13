FactoryGirl.define do
  factory :user do
    name     "Example User"
    email    "user@example.com"
    username "user"
    password "foobarbazqux"
    password_confirmation "foobarbazqux"
  end
end
