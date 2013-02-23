require 'acceptance_helper'

feature "User views validation messages" do

  background do
    sign_in
  end

  scenario do
    visit new_contact_path
    click_button 'Save'
    page.should have_content "Full Name can't be blank"
  end
end
