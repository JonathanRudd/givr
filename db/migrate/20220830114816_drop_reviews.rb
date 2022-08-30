class DropReviews < ActiveRecord::Migration[6.1]
  def change
    drop_table :reviews do |t|
      t.string "content"
      t.integer "rating"
      t.bigint "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.foreign_key ["user_id"], name: "index_reviews_on_user_id"
    end
  end
end
