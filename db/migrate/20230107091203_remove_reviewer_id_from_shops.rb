class RemoveReviewerIdFromShops < ActiveRecord::Migration[6.1]
  def change
    remove_column :shops, :reviewer_id, :string
  end
end
