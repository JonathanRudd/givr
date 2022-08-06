class RemoveTimeFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :time, :integer
  end
end
