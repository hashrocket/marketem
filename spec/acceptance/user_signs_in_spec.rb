require 'acceptance_helper'

feature "User signs in" do

  scenario "Sign in to campaigns page" do
    page.driver.browser.basic_authorize(ENV["BASIC_AUTH_NAME"],
                                        ENV["BASIC_AUTH_PASSWORD"])
    visit "/"
    page.should have_content 'Campaigns'
  end

  scenario "Failed sign in" do
    visit "/"
    page.should_not have_content 'Campaigns'
  end

end
