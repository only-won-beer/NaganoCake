class Delivery < ApplicationRecord

  belongs_to :customer

  def address_display
     '〒' + postcode + ' ' + address + ' ' + address_name
  end
end
