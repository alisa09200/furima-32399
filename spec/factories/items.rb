FactoryBot.define do
  factory :item do
    product { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    price { Faker::Number.number(digits: 4) }
    category_id { Faker::Number.within(range: 2..11) }
    condition_id { Faker::Number.within(range: 2..8) }
    postage_id { Faker::Number.within(range: 2..3) }
    area_id { Faker::Number.within(range: 2..48) }
    period_id { Faker::Number.within(range: 2..4) }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
