class Shop < ApplicationRecord

  has_many :reviewer_comments, dependent: :destroy
  has_many :shop_pay_relations, dependent: :destroy
  has_many :shop_payments,through: :shop_pay_relations, dependent: :destroy
  belongs_to :genre

end
