class RemoveCustomer < ActiveRecord::Migration
  def change
    drop_table :customers
    add_column :bookings, :firstName, :string
    add_column :bookings, :lastName, :string
    add_column :bookings, :email, :string
    add_column :bookings, :phoneNumber, :string
    add_column :bookings, :status, :string
  end
end
