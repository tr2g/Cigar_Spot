class ReviewerComment < ApplicationRecord

  belongs_to :reviewer
  belongs_to :shop

  #★評価用の記述
  #  validates :rate, numericality: {
  #  less_than_or_equal_to: 5,
  #  greater_than_or_equal_to: 1
  #}, presence: true


  #検索方法の分岐
  def self.looks(search, word)
    if search == "partial_match"
      @reviewer_comment = ReviewerComment.where("body LIKE?", "%#{word}")
    else
      @reviewer_comments = ReviewerComment.all
    end
  end
end
