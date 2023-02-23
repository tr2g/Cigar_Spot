class ShopPayment < ApplicationRecord
  validates :payment_name, presence: true
  
  has_many :shop_pay_relations, dependent: :destroy
  has_many :shops, through: :shop_pay_relations
end
