ActionMailer::Base.smtp_settings = {
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'mail.google.com',
    :user_name            => 'pair.dro@gmail.com',
    :password             => 'ghbdtnrfrltkf',
    :authentication       => :plain,
    :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.perform_deliveries = true