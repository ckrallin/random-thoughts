class ChangeDefaultFavorite < ActiveRecord::Migration[5.2]
  def change
    change_column_default :thoughts, :favorite, false
  end
end
