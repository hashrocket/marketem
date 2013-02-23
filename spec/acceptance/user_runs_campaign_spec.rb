require 'acceptance_helper'

feature "User runs campaign" do
  background do
    sign_in
  end
  scenario "User runs campaign" do
    campaign = Fabricate(:campaign)
    contact = Fabricate(:contact)
    campaign.overwrite_recipients_with(contact)
    visit edit_campaign_path(campaign)
    click_link "Run Campaign"
    TextMessager.should_receive(:send).with(
      body: campaign.message,
      phone_numbers: contact.phone)
  end 
end
