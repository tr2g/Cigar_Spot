class ShopPayment < ApplicationRecord

  belongs_to :shop, dependent: :destroy

end
