class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :buyer_id
      t.integer :product_id
      t.string :shipping_address
      t.string :location

      t.timestamps
    end
  end
end
