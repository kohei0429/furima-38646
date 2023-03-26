FactoryBot.define do
  factory :furima_form do
    postcode           {'123-4567'}
    shipping_area_id   {2}
    city               {'大阪府'}
    city_number        {'1-1'}
    building_name      {'大阪ハイツ'}
    phone_number       {'09011112222'}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end