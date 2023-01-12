class CreateAdminShopPayRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_pay_relations do |t|
    t.string :name

      t.timestamps
    end
  end
end
