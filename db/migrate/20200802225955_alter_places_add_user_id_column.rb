class AlterPlacesAddUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_index :places, :user_id
  end
end
