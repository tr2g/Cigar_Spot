class ReviewerComment < ApplicationRecord

  belongs_to :reviewer
  belongs_to :shop

  scope :active_comments, -> { includes(:reviewer).where(reviewers: { is_deleted: false}) }
  #↑reviwerモデルを検索する.where(モデル名+s: {退会してないreviewer})
  #モデルにこれ書いておけばコントローラーが見やすくなる。

  #★評価用の記述
  #  validates :rate, numericality: {
  #  less_than_or_equal_to: 5,
  #  greater_than_or_equal_to: 1
  #}, presence: true

end
