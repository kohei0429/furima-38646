class FurimaForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipping_area_id, :city, :city_number, :building_name, :phone_number

  with_options presence: true do

    #purchaseモデルのバリテーション
    validates :user_id
    validates :item_id

    #shipモデルのバリテーション
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :city
    validates :city_number
    validates :building_name
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Ship.create(postcode: postcode, shipping_area_id: shipping_area_id, city: city, city_number: city_number, building_name: building_name, phone_number: phone_number)
  end
end