class UpdateBooking < ActiveRecord::Migration
  def change
    remove_columns :bookings, :roomFatna, :roomLeila, :roomMeyer, :roomMimzy, :roomRiad, :roomSafia, :roomSara, :roomZitouni
    rename_column :bookings, :roomFatnaGuest, :roomFatnaGuests
  end

  def down
  end
end
