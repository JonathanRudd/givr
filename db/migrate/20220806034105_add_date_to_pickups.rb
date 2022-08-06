class AddDateToPickups < ActiveRecord::Migration[6.1]
  def change
    add_column :pickups, :date, :date
  end
end
