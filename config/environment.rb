# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleApp::Application.initialize!

Date::DATE_FORMATS.merge!(:default => "%m/%d/%Y")

config.action_mailer.delivery_method = :smtp



config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "http://skfoodgroup.herokuapp.com",
  authentication: "plain",
  enable_starttls_auto: true,
  user_name: "dylan.conlin@gmail.com",
  password: "eggboobsmashstink"
}

# Specify what domain to use for mailer URLs
config.action_mailer.default_url_options = {host: "skfoodgroup.herokuapp.com"}

config.action_mailer.raise_delivery_errors = true
