require 'acceptance_helper'

feature "User manages campaigns", %q{
  In order to obtain key marketing data
  As a user
  I want to manage marketing campaigns
} do

  background do
    sign_in
  end

  scenario "User creates a new campaign" do
    visit root_path
    click_link "Campaigns"
    click_link "Create a Campaign"
    fill_in "Campaign Name", with: "Cola Campaign"
    fill_in "Postback URL", with: "http://cola-corp.com"
    fill_in "Message", with: "Bet you'd like a frosty cola!"
    click_button "Save"
    page.current_path.should == campaigns_path
    page.should have_content "Hooray! Your campaign was successfully added"
  end

  scenario "User views campaigns" do
    campaign = cola_campaign
    campaign.update_attribute(:created_at, '2013-02-20')
    visit campaigns_path
    page.should have_content 'Cola Campaign'
    page.should have_content '02/20/2013'
  end

  scenario "User edits campaign" do
    cola_campaign
    visit campaigns_path
    click_link "Cola Campaign"
    fill_in "Campaign Name", with: "Juice Campaign"
    click_button "Save"
    page.should have_content "Juice Campaign"
    page.should_not have_content "Cola Campaign"
  end

  scenario "User adds recipients by state" do
    Fabricate(:contact, state: "FL")
    Fabricate(:contact, state: "NY")
    visit edit_campaign_path(cola_campaign)
    select "Florida", from: "State"
    click_button "Save"
    page.should have_content "1 Recipient"
  end

  def cola_campaign
    Campaign.create(
      name: "Cola Campaign",
      postback_url: "http://cola-corp.com",
      message: "Bet you'd like a frosty cola!")
  end

end
