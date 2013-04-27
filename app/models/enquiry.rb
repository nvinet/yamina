class Enquiry < ActiveRecord::Base
  attr_accessible :message,
                  :subject,
                  :customer

  belongs_to :customer

  accepts_nested_attributes_for :customer

  validates :subject, :message, :presence => true
  validates_associated :customer
end
