require 'acceptance_helper'

feature "User manages contacts", %q{
  As a user
  In order to create and run campaigns
  I need to manage contacts in my system
} do

  background do
    sign_in
  end

  scenario "User views contacts" do
    Contact.create(name: "John McClane",
                   phone: "19041231234",
                   state: "FL",
                   female: false,
                   birth_date: 43.years.ago)

    visit root_path
    click_link "Contacts"
    page.should_not have_css ".msg_warning"
    page_has_john_mcclane
  end

  scenario "User views empty contacts page" do
    visit contacts_path
    within ".msg_warning" do
      page.should have_content "contacts yet"
    end
  end

  scenario "User adds new contact" do
    visit contacts_path
    click_link "Add a Contact"
    fill_in "Full Name", with: "John McClane"
    fill_in "Phone Number", with: "19041231234"
    select "Florida", from: "State"
    select "Male", from: "Gender"
    select "January", from: "contact_birth_date_2i"
    select "1", from: "contact_birth_date_3i"
    select 43.years.ago.year.to_s, from: "contact_birth_date_1i"
    click_on "Save"
    page.should have_content 'Hooray! Your contact was successfully added'
    page_has_john_mcclane
  end

  def page_has_john_mcclane
    ['John McClane', '43', '904-123-1234', 'Male', 'FL'].each do |val|
      page.should have_content val
    end
  end

end
