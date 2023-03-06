class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :user_id
    validates :image
    validates :title
    validates :text
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
