class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :access
      t.string :hours
      t.timestamps
    end
  end
end
