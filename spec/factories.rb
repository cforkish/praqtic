FactoryGirl.define do
  factory :user do
    sequence(:name)     { |n| "Person #{n}" }
    sequence(:email)    { |n| "person_#{n}@example.com"}
    sequence(:username) { |n| "person#{n}"}
    password "foobarbazqux"
    password_confirmation "foobarbazqux"

    factory :admin do
      admin true
    end
  end
end
