FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'Libby'
    last_name 'Levine'
    sequence(:username) { |n| "username #{n}"}
    password 'password'
    password_confirmation 'password'
    admin false 
  end
end
