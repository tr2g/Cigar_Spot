class Shop < ApplicationRecord

  has_many :reviewer_comments, dependent: :destroy
  has_many :shop_payments, dependent: :destroy
  belongs_to :genre

end
