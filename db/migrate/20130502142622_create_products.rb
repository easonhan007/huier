class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :img
      t.integer :category_id

      t.timestamps
    end
  end
end
