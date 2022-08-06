class RemoveDateFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :date, :date
  end
end
