class CreateReviewTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :review_tag_relations do |t|
      t.references :reviewer_comment, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
