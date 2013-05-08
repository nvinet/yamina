class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :firstName,
                :lastName,
                :email,
                :phoneNumber,
                :message,
                :arrival,
                :departure,
                :roomFatnaGuests,
                :roomLeilaGuests,
                :roomMeyerGuests,
                :roomMimzyGuests,
                :roomRiadGuests,
                :roomSafiaGuests,
                :roomSaraGuests,
                :roomZitouniGuests

  def initialize(attributes = {})
    if not attributes.nil?
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def persisted?
    false
  end

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

  validates :message, :presence => true
end