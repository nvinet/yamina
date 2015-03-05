# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
    :user_name => "app14768484@heroku.com",
    :password => "it1ls0hw",
    :domain => "riadyamina.com",
    :address => "smtp.sendgrid.net",
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

# Initialize the rails application
RiadRails::Application.initialize!
