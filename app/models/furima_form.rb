class FurimaForm
  include ActiveModel::Model

  attr_accessor :item, :postcode, :shipping_area_id, :city, :city_number, :building_name, :phone_number, :purchase,

  with_options presence: true do
    validates :item
    validates :postcode
    validates :shipping_area_id
    validates :city
    validates :city_number
    validates :building_name
    validates :phone_number
    validates :purchase
  end

  def save
    purchase.create(item: item)
    ship.create(postcode: postcode, shipping_area_id: shipping_area_id, city: city, city_number: city_number, building_name: building_name, phone_number: phone_number, purchase: purchase)
  end
end