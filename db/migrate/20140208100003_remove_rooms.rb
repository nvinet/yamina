class RemoveRooms < ActiveRecord::Migration
  def change
    drop_table :rooms
    drop_table :bookings
  end
end
