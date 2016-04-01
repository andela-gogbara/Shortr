require "rails_helper"

describe "API KEY", js: true do
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end
  it "allows registered users to see their API Key" do
    signup_helper
    click_link("API KEY")
    expect(page).to have_content("This is your personal api key")
  end
end
