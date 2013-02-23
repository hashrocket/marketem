class TextMessager

  attr_reader :client, :from

  def initialize
    @client = Twilio::REST::Client.new(
      ENV['TWILIO_SID'],
      ENV['TWILIO_AUTH_TOKEN'])
    @from = '19045675361'
  end

  def send(args)
    client_messages.create(
      from: from,
      to: args[:phone_numbers],
      body: args[:body])
  end

  def client_messages
    client.account.sms.messages
  end

end
