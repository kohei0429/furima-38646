class Ship < ApplicationRecord

  belongs_to :purchase

  with_options presence: true do
    validates :postcode
    validates :shipping_area_id
    validates :city
    validates :city_number
    validates :building_name
    validates :phone_number
    validates :purchase
  end
  
end
