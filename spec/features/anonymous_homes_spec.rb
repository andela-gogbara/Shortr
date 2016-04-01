require "rails_helper"

RSpec.feature "AnonymousHomes", type: :feature do
  before :all do
    Capybara.current_driver = :selenium
  end
  let(:link) { FactoryGirl.create(:link) }

  it "returns shorten url" do
    visit("/")
    fill_in("link_full_url", with: "facebook.com")
    click_button("Make Shortr")

    expect(page).to have_content("127.0.0.1")
  end

  it "displays sections for popular links" do
    visit root_path
    expect(page).to have_content("Popular Links")
  end

  it "displays sections for recent links" do
    visit root_path
    expect(page).to have_content("Recent Links")
  end

  it "displays sections for influential users" do
    visit root_path
    expect(page).to have_content("Top Users")
  end

  after :all do
    Capybara.default_driver
  end
end
