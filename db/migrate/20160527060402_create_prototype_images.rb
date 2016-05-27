class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.string :image
      t.integer :type
      t.references :prototype
      t.timestamps
    end
  end
end
