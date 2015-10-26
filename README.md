# twilio-carrier

[![Build Status](https://api.travis-ci.org/emn178/twilio-carrier.png)](https://travis-ci.org/emn178/twilio-carrier)
[![Coverage Status](https://coveralls.io/repos/emn178/twilio-carrier/badge.svg?branch=master)](https://coveralls.io/r/emn178/twilio-carrier?branch=master)

An [sms_carrier](https://github.com/emn178/sms_carrier) delivery method for Twilio SMS service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twilio-carrier'
```

And then execute:

    bundle

Or install it yourself as:

    gem install twilio-carrier

## Usage

Set up delivery method and Twilio settings in you rails config, eg. `config/environments/production.rb`
```Ruby
config.sms_carrier.delivery_method = :twilio
config.sms_carrier.twilio_settings = {
  :account_sid => 'YOUR TWILIO ACCOUNT SID',
  :auth_token => 'YOUR TWILIO AUTH TOKEN',
  :from => 'YOUR TWILIO NUMBER'
}
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/twilio-carrier  
Author: emn178@gmail.com
