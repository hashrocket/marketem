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
end
