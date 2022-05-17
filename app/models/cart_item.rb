class CartItem < ApplicationRecord

  belongs_to:costomer
  belongs_to:order_detail

end
