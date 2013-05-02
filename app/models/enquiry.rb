class Enquiry < ActiveRecord::Base
  attr_accessible :message,
                  :customer

  belongs_to :customer

  accepts_nested_attributes_for :customer

  validates :message, :presence => true
  validates_associated :customer
end
