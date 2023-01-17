class AddRateToReviewerComments < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewer_comments, :rate, :float, null: false, default: 0
  end
end
