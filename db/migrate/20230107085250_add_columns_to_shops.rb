class AddColumnsToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :reviewer_id, :integer
    add_column :shops, :genre_id, :integer
  end
end
