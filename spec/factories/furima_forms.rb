FactoryBot.define do
  factory :furima_form do
    user_id            {1}
    item_id            {1}
    postcode           {'123-4567'}
    shipping_area_id   {2}
    city               {'大阪府'}
    city_number        {'1-1'}
    building_name      {'大阪ハイツ'}
    phone_number       {'09011112222'}
  end
end