FactoryGirl.define do

  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    profile { Faker::Hacker.say_something_smart }
    member { Faker::Company.name }
    works { Faker::Company.profession }
    password "00000000"
    password_confirmation "00000000"
  end

end
