class ShopPayRelation < ApplicationRecord

  belongs_to :shop
  belongs_to :shop_payment

end
