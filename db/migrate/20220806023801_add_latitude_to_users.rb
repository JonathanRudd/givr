class AddLatitudeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :latitude, :float
  end
end
