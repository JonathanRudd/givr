class RemoveAddressFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :address, :string
  end
end
