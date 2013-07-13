class Booking < ActiveRecord::Base
  attr_accessible :firstName,
                  :lastName,
                  :email,
                  :phoneNumber,
                  :airportPickup,
                  :arrival,
                  :departure,
                  :deposit,
                  :extra,
                  :flightNumber,
                  :nights,
                  :roomFatnaGuests,
                  :roomLeilaGuests,
                  :roomMeyerGuests,
                  :roomMimzyGuests,
                  :roomRiadGuests,
                  :roomSafiaGuests,
                  :roomSaraGuests,
                  :roomZitouniGuests,
                  :total,
                  :status

  validates :firstName,
            :presence => true,
            :length => {:in => 2..50},
            :format => {:with => /[a-zA-Z ]+/, :message => "Invalid firstname"}

  validates :lastName,
            :presence => true,
            :length => {:in => 2..50},
            :format => {:with => /[a-zA-Z ]+/, :message => "Invalid lastname"}

  validates :email,
            :presence => true,
            :length => {:maximum => 50},
            :format => {:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "Invalid email address"}

  validates :phoneNumber,
            :allow_blank => true,
            :length => {:in => 2..50},
            :format => {:with => /[a-zA-Z()\-+\d ]+/, :message => "Invalid phone number"}

  validates :arrival,
            :presence => true

  validates :departure,
            :presence => true

end
