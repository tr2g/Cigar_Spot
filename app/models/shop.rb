class Shop < ApplicationRecord

  validates :shop_image, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :access, presence: true
  validates :introduction, presence: true
  validates :hours, presence: true
  validates :shop_payment_ids, presence: true
  validates :genre_id, presence: true
  validates :tag_ids, presence: true

  has_many :reviewer_comments, dependent: :destroy
  has_many :shop_pay_relations, dependent: :destroy
  has_many :shop_payments,through: :shop_pay_relations
  belongs_to :genre
  has_many :shop_tag_relations, dependent: :destroy
  has_many :tags, through: :shop_tag_relations
  has_many :favorites, dependent: :destroy

  has_one_attached :shop_image

  accepts_nested_attributes_for :shop_pay_relations

  def get_shop_image
    (shop_image.attached?) ? shop_image : 'no_image.jpg'
  end

  def favorited_by?(reviewer)
    favorites.exists?(reviewer_id: reviewer.id)
  end


end
