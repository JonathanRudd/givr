class RemoveColumnFromNotifications < ActiveRecord::Migration[6.1]
  def change
    remove_column :notifications, :comment_id, :integer
    remove_column :notifications, :message_id, :integer
  end
end
