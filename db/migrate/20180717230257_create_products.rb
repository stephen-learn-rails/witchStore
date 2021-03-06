class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.boolean :featured

      t.timestamps
    end
  end
end
