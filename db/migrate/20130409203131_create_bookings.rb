class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :arrival
      t.datetime :departure
      t.integer :nights
      t.decimal :total
      t.decimal :deposit
      t.decimal :extra
      t.string :flightNumber
      t.boolean :airportPickup
      t.boolean :roomLeila
      t.integer :roomLeilaGuests
      t.boolean :roomMeyer
      t.integer :roomMeyerGuests
      t.boolean :roomMimzy
      t.integer :roomMimzyGuests
      t.boolean :roomSafia
      t.integer :roomSafiaGuests
      t.boolean :roomZitouni
      t.integer :roomZitouniGuests
      t.boolean :roomSara
      t.integer :roomSaraGuests
      t.boolean :roomFatna
      t.integer :roomFatnaGuest
      t.boolean :roomRiad
      t.integer :roomRiadGuests

      t.timestamps
    end
  end
end
