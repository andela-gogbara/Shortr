require 'rails_helper'

RSpec.feature "AnonymousHomes", type: :feature do
  before :all do
    Capybara.current_driver = :selenium
  end
  let(:link) {FactoryGirl.create(:link)}

  it "returns shorten url" do
    visit("/")
    fill_in("link_full_url", :with => "facebook.com")
    # byebug
    click_button("Make Shortr")

    expect(page).to have_content("localhost")
  end

  it "redirects the user" do
    visit("/#{link.short_url}")
    # byebug
    expect(current_path).to eql "test"
  end

  after :all do
    Capybara.default_driver
  end
end
