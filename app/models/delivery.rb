class Delivery < ApplicationRecord

  belongs_to :customer

  validates :postcode, presence: true
  validates :address, presence: true
  validates :address_name, presence: true



  def address_display
     '〒' + postcode + ' ' + address + ' ' + address_name
  end
end
