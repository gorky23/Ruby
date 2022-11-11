class AddPlaceToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :place, :integer, null: false, default: Friend.places[:other]
  end
end
