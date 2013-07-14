class ContactMailer < ActionMailer::Base
  def enquire(contact)
    @contact = contact
    @rooms = Room.all
    mail(
        :to => APP_CONFIG['email_to'],
        :from => contact.email,
        :subject => "Riad Enquiry"
    )
  end

  def confirm(booking, pricing)
    @booking = booking
    @pricing = pricing
    @rooms = Room.all
    mail(
        :to => booking.email,
        :from => APP_CONFIG['booking_email_to'],
        :subject => "Booking confirmation"
    )
  end

  def ref(booking, pricing)
    @booking = booking
    @pricing = pricing
    @rooms = Room.all
    mail(
        :to => APP_CONFIG['booking_email_to'],
        :from => booking.email,
        :subject => "Booking confirmation - #{@booking.firstName} #{@booking.lastName}"
    )
  end
end
