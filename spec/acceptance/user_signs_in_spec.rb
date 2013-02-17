require 'acceptance_helper'

feature "User signs in" do

  scenario "Sign in to campaigns page" do
    sign_in
    visit "/"
    page.should have_content 'Campaigns'
  end

  scenario "Failed sign in" do
    visit "/"
    page.should_not have_content 'Campaigns'
  end

end
