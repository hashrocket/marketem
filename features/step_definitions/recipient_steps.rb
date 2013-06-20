When /^I create a new recipient$/ do
  fill_in "full_name", with: "Jane Doe"
  fill_in "phone", with: "555-7070"
  select "Florida", from: "state"
  select "Female", from: "gender"
  click_button "Save"
end

Then /^I should be on the recipients list$/ do
  within(".heading h1") do
    page.should have_content("Recipients")
  end
end

Then /^I should see my new recipient listed$/ do
  page.should have_content("Jane Doe")
  page.should have_content("555-7070")
  page.should have_content("Florida")
  page.should have_content("Female")
  page.should_not have_content("All fields are required")
end
