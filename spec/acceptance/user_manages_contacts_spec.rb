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

    visit contacts_path
    ['John McClane', '43', '904-123-1234', 'Male', 'FL'].each do |val|
      page.should have_content val
    end
  end

end
