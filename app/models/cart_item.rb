class CartItem < ApplicationRecord

  belongs_to:costomer
  # belongs_to:order_detail
  belongs_to:item

end
