class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :door_color
      t.string :room_color
      t.string :floor_color

      t.timestamps
    end
  end
end
