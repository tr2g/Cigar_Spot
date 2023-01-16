class CreateAdminShopPayRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_pay_relations do |t|
      t.integer :shop_id
      t.integer :shop_payment_id
      t.timestamps
    end
  end
end
