class ReviewTagRelation < ApplicationRecord

  belongs_to :reviewer_comment
  belongs_to :tag

end
