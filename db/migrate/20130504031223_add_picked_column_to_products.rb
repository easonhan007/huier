class AddPickedColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :picked, :boolean, default: false
  end
end
