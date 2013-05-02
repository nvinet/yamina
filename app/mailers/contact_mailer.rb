class ContactMailer < ActionMailer::Base
  def enquire(enquiry)
    @enquiry = enquiry
    mail(
        :to => Rails.application.config.email_to,
        :from => enquiry.customer.email,
        :subject => "Riad Enquiry"
    )
  end
end
