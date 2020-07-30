class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :user_id
      t.string :location
      t.string :title
      t.float :latitude
      t.float :longitude
      t.date :start
      t.date :end
      t.timestamps
    end
  end
end
