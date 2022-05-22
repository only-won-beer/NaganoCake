class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries
  has_many :cart_items
  has_many :orders
  has_many :items, through: :cart_items
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  def full_name
    self.last_name + self.first_name
  end

  def full_address
     '〒' + postcode + ' ' + address
  end

end
