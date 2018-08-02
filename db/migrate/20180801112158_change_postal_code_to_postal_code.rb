class ChangePostalCodeToPostalCode < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :postalCode, :postal_code
  end
end
