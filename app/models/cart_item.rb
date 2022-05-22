class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  validates :quantity, presence: true

  def subtotal
    item.with_tax_price * quantity
  end
end
