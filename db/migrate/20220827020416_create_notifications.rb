class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :comment_id
      t.integer :message_id

      t.timestamps
    end
  end
end
