class ChangeStatusInPickups < ActiveRecord::Migration[6.1]
  def change
    remove_column :pickups, :status
    add_column :pickups, :status, :integer, default: 0
  end
end
