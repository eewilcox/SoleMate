FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'Libby'
    last_name 'Levine'
    sequence(:username) { |n| "Nolan#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
