class CreateShopTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_tag_relations do |t|
      t.references :shop, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
