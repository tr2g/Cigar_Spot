class AddShopIdToShopPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :shop_payments, :shop_id, :integer
  end
end
