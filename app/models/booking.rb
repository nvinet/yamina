class Booking < ActiveRecord::Base
  attr_accessible :airportPickup,
                  :arrival,
                  :departure,
                  :deposit,
                  :extra,
                  :flightNumber,
                  :nights,
                  :roomFatna,
                  :roomFatnaGuest,
                  :roomLeila,
                  :roomLeilaGuests,
                  :roomMeyer,
                  :roomMeyerGuests,
                  :roomMimzy,
                  :roomMimzyGuests,
                  :roomRiad,
                  :roomRiadGuests,
                  :roomSafia,
                  :roomSafiaGuests,
                  :roomSara,
                  :roomSaraGuests,
                  :roomZitouni,
                  :roomZitouniGuests,
                  :total

  belongs_to :customer

  validates :airportPickup,
            :presence => false

  validates :arrival,
            :presence => true

  validates :departure,
            :presence => true

  validates :flightNumber,
            :presence => false,
            :length => {:in => 2..50},
            :format => {:with => /[a-zA-Z()\-+\d ]+/, :message => 'Invalid flight number'}

end
