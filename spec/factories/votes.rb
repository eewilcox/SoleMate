FactoryGirl.define do
  factory :vote do
    review
    user
    poll true
  end
end
