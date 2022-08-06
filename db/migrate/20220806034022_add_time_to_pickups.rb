class AddTimeToPickups < ActiveRecord::Migration[6.1]
  def change
    add_column :pickups, :time, :integer
  end
end
