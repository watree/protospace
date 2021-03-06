class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :title
      t.string :catch_copy
      t.text :concept
      t.integer :likes_count, default: 0
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
