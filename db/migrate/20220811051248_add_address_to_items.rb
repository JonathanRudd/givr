class AddAddressToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :address, :string
  end
end
