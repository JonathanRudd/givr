class AddSeenToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :seen, :boolean, :default => false
  end
end
