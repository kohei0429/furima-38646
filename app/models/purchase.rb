class Purchase < ApplicationRecord

  validates: item, presense: true
  
  belongs_to :user
  belongs_to :item
  has_one :ship

end
