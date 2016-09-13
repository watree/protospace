FactoryGirl.define do

  factory :prototype do
    title { Faker::Commerce.product_name }
    catch_copy { Faker::Company.catch_phrase }
    concept { Faker::Lorem.sentence }

    trait :with_comments do
      transient do
        comments_count 5
      end
      after(:create) do |prototype, evaluator|
        evaluator.comments_count.times do
          prototype.comments.create(text: 'text')
        end
      end
    end

    trait :with_likes do
      transient do
        like_count 5
      end
      after(:create) do |prototype, evaluator|
        evaluator.like_count.times do
          prototype.likes.create
        end
      end
    end
  end

end

