FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'隆太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birth                 {Faker::Date.birthday}
  end
end
