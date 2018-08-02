class AddInitialDataToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :address, :string
    add_column :users, :postalCode, :string
  end
end
