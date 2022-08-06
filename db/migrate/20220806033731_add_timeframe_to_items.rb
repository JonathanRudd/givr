class AddTimeframeToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :timeframe, :string
  end
end
