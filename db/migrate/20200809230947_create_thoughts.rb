class CreateThoughts < ActiveRecord::Migration[5.2]
  def change
    create_table :thoughts do |t|
      t.integer :user_id
      t.integer :place_id
      t.boolean :favorite
      t.string :description
      t.timestamps
    end
    add_index :thoughts, [:user_id, :place_id]
    add_index :thoughts, :place_id
  end
end
