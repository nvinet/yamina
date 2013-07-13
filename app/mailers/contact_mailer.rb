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
end
