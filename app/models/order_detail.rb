class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  
  validates :production_status, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

  enum production_status: { impossible: 0, waiting: 1, making: 2, completion: 3 }
  
end
