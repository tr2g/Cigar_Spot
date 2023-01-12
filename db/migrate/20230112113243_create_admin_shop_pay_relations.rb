class CreateAdminShopPayRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_shop_pay_relations do |t|

      t.timestamps
    end
  end
end
