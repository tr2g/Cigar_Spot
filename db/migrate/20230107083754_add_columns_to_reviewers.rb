class AddColumnsToReviewers < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewers, :nickname, :string
    add_column :reviewers, :birthday, :integer
  end
end
