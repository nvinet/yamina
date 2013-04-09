class Enquiry < ActiveRecord::Base
  attr_accessible :message,
                  :subject

  belongs_to :customer

  validates :subject, :presence => true
  validates :message, :presence => true
end
