require 'spec_helper'

describe TwilioCarrier::Base do
  before { 
    @posts = []
    allow_any_instance_of(Twilio::REST::BaseClient).to receive(:connect_and_send) do |client, post|
      @posts << post
      {}
    end
    sms.deliver_now
  }
  let(:sms) { SmsCarrier::Base.sms(message) }
  subject { @posts[0] }

  context "with single to" do
    context "without media_url" do
      let(:message) { {:from => '+886987654321', :to => '+886912345678', :body => 'SMS Body'} }
      it { expect(@posts.length).to eq 1 }
      its(['authorization']) { should eq 'Basic U0lEOlRPS0VO'}
      its(:path) { should eq '/2010-04-01/Accounts/SID/Messages.json'}
      its(:body) { should eq 'From=%2B886987654321&Body=SMS+Body&To=%2B886912345678'}
    end

    context "with media_url" do
      let(:message) { {:from => '+886987654321', :to => '+886912345678', :body => 'SMS Body', :media_url => 'http://example.com/smileyface.jpg'} }
      it { expect(@posts.length).to eq 1 }
      its(['authorization']) { should eq 'Basic U0lEOlRPS0VO'}
      its(:path) { should eq '/2010-04-01/Accounts/SID/Messages.json'}
      its(:body) { should eq 'From=%2B886987654321&Body=SMS+Body&MediaUrl=http%3A%2F%2Fexample.com%2Fsmileyface.jpg&To=%2B886912345678'}
    end
  end

  context "with multiple to" do
    let(:message) { {:from => '+886987654321', :to => ['+886912345678', '+886963852741'], :body => 'SMS Body'} }
  
    context "without media_url" do
      it { expect(@posts.length).to eq 2 }
      its(['authorization']) { should eq 'Basic U0lEOlRPS0VO'}
      its(:path) { should eq '/2010-04-01/Accounts/SID/Messages.json'}
      its(:body) { should eq 'From=%2B886987654321&Body=SMS+Body&To=%2B886912345678'}
      it { expect(@posts[1].body).to eq 'From=%2B886987654321&Body=SMS+Body&To=%2B886963852741'}
    end
  end
end
