# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app143906978@heroku.com",
    :password       => "ecykypad2217",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
