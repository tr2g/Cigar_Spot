class ReviewerComment < ApplicationRecord

  belongs_to :reviewer
  belongs_to :shop

  #★評価用の記述
  #  validates :rate, numericality: {
  #  less_than_or_equal_to: 5,
  #  greater_than_or_equal_to: 1
  #}, presence: true

end
