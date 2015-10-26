require 'twilio-ruby'

module TwilioCarrier
  class Base
    attr_accessor :settings

    def initialize(settings)
      self.settings = settings
    end

    def deliver!(sms)
      client = Twilio::REST::Client.new settings[:account_sid], settings[:auth_token]
      from = sms.from || settings[:from]
      message = { from: from, body: sms.body }
      message[:media_url] = sms.options[:media_url] unless sms.options[:media_url].nil?
      sms.to.each do |to|
        message[:to] = to
        client.messages.create(message)
      end
    end
  end
end
