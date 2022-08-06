class RemoveImageFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :image, :string
  end
end
