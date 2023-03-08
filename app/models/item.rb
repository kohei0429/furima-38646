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
    validates :image
    validates :title
    validates :text
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price

  end

  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
