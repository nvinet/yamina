class Customer < ActiveRecord::Base
  attr_accessible :firstName,
                  :email,
                  :lastName,
                  :phoneNumber

  has_many :enquiries
  has_many :bookings

  validates :firstName,
            :presence => true,
            :length => { :in => 2..50 },
            :format => {:with => /[a-zA-Z ]+/, :message => "Invalid firstname"}

  validates :lastName,
            :presence => true,
            :length => { :in => 2..50 },
            :format => {:with => /[a-zA-Z ]+/, :message => "Invalid lastname"}

  validates :email,
            :presence => true,
            :uniqueness => true,
            :length => { :maximum => 50 },
            :format => {:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "Invalid email address"}

  validates :phoneNumber,
            :allow_blank => true,
            :presence => false,
            :length => { :in => 2..50 },
            :format => {:with => /[a-zA-Z()\-+\d ]+/, :message => "Invalid phone number"}
end
