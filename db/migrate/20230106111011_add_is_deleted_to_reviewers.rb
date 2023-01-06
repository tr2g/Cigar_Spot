class AddIsDeletedToReviewers < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewers, :is_deleted, :boolean, default: false
  end
end
