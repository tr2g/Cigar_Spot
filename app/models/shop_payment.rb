class ShopPayment < ApplicationRecord

  has_many :shop_pay_relations
  has_many :shops, through: :shop_pay_relations
end
