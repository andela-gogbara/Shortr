Given(/^that I am an anonymous user of the system$/) do
end

When(/^I visit the site$/) do
  visit("/")
end

When(/^give a URL to the service$/) do
  fill_in("link_full_url", :with => "http://www.facebook.com")
  click_button("Make Shortr")
end

Then(/^I expect it to return a service shortened URL$/) do
  expect(page).to have_button("Make Shortr")
end

When(/^I follow a service shortened URL$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I expect to be redirected to the original URL$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I expect to see URLs sorted by popularity$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I expect to see URLs sorted by how recently they were added$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
