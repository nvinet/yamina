class RemoveEnquiry < ActiveRecord::Migration
  def change
    drop_table :enquiries
  end
end
