class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :time
      t.date :date

      t.timestamps
    end
  end
end
