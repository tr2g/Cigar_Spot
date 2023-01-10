class CreateShopPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_payments do |t|
      t.string :payment_name
      t.timestamps
    end
  end
end
