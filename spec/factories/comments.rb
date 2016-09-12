FactoryGirl.define do

  factory :comment do
    text { Faker::Lorem.sentence }
    user
    product
  end
end