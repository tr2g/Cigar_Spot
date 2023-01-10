class CreateReviewerComments < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewer_comments do |t|
      t.integer :reviewer_id
      t.integer :shop_id
      t.string :title
      t.text :body
      t.float :star_rate
      t.timestamps
    end
  end
end
