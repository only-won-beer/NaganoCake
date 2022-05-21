class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  
  enum status: { waiting: 0, confirm: 1, production: 2, preparation: 3, sent: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def status_display
    status_i18n
  end
  
  def payment_method_display
    payment_method_i18n
  end
    
end
