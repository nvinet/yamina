class UpdateEnquiries < ActiveRecord::Migration
  def change
    remove_column :enquiries, :subject
  end

end
