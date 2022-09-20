class ChangeNumRoomsInListings < ActiveRecord::Migration[7.0]
  def change
    rename_column :listings, :num_rooms, :num_room
  end
end
