FactoryBot.define do
  factory :item do

    association :user

    title              {Faker::Name.name}
    text               {Faker::Lorem.sentence}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    condition_id       {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    shipping_area_id   {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id    {Faker::Number.between(from: 2, to: 4)}
    price              {Faker::Number.between(from: 300, to: 9_999_999)}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
