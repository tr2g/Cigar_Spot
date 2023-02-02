class AddScoreToReviewerComments < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewer_comments, :score, :decimal, precision: 5, scale: 3
  end
end
