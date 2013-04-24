class Room < ActiveRecord::Base
  attr_accessible :description,
                  :guestMax,
                  :guestMin,
                  :link,
                  :name,
                  :priceMax,
                  :priceMin,
                  :roomType

  validates :name,
            :presence => true,
            :length => {:in => 2..50}

  validates :description,
            :presence => true

  validates :priceMin,
            :presence => true

  validates :priceMax,
            :presence => true

  validates :guestMin,
            :presence => true

  validates :guestMax,
            :presence => true

  validates :link,
            :presence => false

  validates :roomType,
            :presence => true
end
