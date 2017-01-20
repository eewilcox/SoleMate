FactoryGirl.define do
  factory :review do
    rating {rand(1..5)}
    sequence(:description) { |n| "description#{n}" }
    shoe
    user
  end
end
