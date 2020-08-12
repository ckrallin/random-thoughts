class AlterThoughtsAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :thoughts, :row_order, :integer
    add_index :thoughts, :row_order
  end
end
