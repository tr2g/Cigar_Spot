class AddColumnsToReviewers < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewers, :nickname, :string, null: false
    add_column :reviewers, :birthday, :date, null: false
  end
end
