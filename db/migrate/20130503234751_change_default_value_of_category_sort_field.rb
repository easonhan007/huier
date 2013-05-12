class ChangeDefaultValueOfCategorySortField < ActiveRecord::Migration
  def up
    change_column :categories, :sort, :integer, default: 0
  end

  def down
    raise ActiveRecord::IrreversibleMigration, 
          "Can't remove the default"
  end
end
