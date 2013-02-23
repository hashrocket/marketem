require 'twilio-ruby'
require 'text_messager'

describe TextMessager do
  describe "#initialize" do
    it "instantiates a new twilio client" do
      TextMessager.new.client.should be_a Twilio::REST::Client
    end
  end

  describe "#send" do
    it "sends a text message" do
      messager = TextMessager.new
      messager.client_messages.stub(:create)

      messager.client_messages.should_receive(:create).with(
        from: messager.from,
        to: "+19043437039",
        body: "Greetings!")

      messager.send(
        body: "Greetings!",
        phone_numbers: "+19043437039")
    end
  end
end
