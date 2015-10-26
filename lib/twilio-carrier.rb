require "sms_carrier"
require "twilio-carrier/version"
require "twilio-carrier/base"

module TwilioCarrier
  SmsCarrier::Base.add_delivery_method :twilio, Base
end
