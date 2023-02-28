class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :reviewer_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
