class Shop < ApplicationRecord

  has_many :reviewer_comments, dependent: :destroy
  has_many :shop_pay_relations, dependent: :destroy
  has_many :shop_payments,through: :shop_pay_relations, dependent: :destroy
  belongs_to :genre
  has_many :shop_tag_relations
  has_many :tags, through: :shop_tag_relations

  has_one_attached :shop_image

  accepts_nested_attributes_for :shop_pay_relations

  def get_shop_image
    (shop_image.attached?) ? shop_image : 'no_image.jpg'
  end



end
