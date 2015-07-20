require 'rails_helper'

describe Message do

  it "doesn't send the message if twilio returns an error", :vcr => true do
    message = Message.new(:body => 'hi there', :to => '64635354', :from => '8182178612')
    message.save.should be false
  end

  it 'adds an error if the to number is invalid', :vcr => true do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '8182178612')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end

  it 'saves number', :vcr => true do
    message = Message.new(:body => 'hi', :to => '5412615469', :from => '8182178612')
    message.save
    message.errors.messages[:base].should eq nil
  end

end
