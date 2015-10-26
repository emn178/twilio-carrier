require 'simplecov'
require 'coveralls'

SimpleCov.add_filter "/spec/"
SimpleCov.add_filter "engine.rb"

if ENV["COVERAGE"]
  SimpleCov.start
elsif ENV["COVERALLS"]
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  Coveralls.wear!
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'twilio-carrier'
require 'rspec/its'

SmsCarrier::Base.delivery_method = :twilio
SmsCarrier::Base.twilio_settings = {
  :account_sid => 'SID',
  :auth_token => 'TOKEN'
}
