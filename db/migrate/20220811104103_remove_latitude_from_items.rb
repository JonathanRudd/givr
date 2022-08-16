class RemoveLatitudeFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :latitude, :float
  end
end
