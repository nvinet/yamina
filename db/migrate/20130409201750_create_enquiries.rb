class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
