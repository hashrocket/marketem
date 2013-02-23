require 'active_record_spec_helper'
require 'campaign'

describe Campaign do
  it "requires a name" do
    Campaign.new.should have(1).errors_on(:name)
  end

  it "requires a postback url" do
    Campaign.new.should have(1).errors_on(:postback_url)
  end

  it "requires a message" do
    Campaign.new.should have(1).errors_on(:message)
  end

  describe "#overwrite_recipients_with" do
    let(:contacts) { stub 'contacts' }
    let(:campaign) { Campaign.new }
    it "it sets the contacts and saves" do
      campaign.should_receive(:contacts=, with: contacts)
      campaign.should_receive(:save)
      campaign.overwrite_recipients_with(contacts)
    end
  end
end
