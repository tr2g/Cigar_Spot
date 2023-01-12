class ReviewerComment < ApplicationRecord

  belongs_to :reviewer, dependent: :destroy
  belongs_to :shop, dependent: :destroy
end
