class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.decimal :priceMin
      t.decimal :priceMax
      t.string :roomType
      t.integer :guestMin
      t.integer :guestMax
      t.string :link

      t.timestamps
    end


  end
end
