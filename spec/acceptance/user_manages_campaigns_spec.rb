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

end
