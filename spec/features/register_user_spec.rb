require "rails_helper"

describe "Registered Users", js: true do
  after :each do
  User.destroy_all
  end

  it "can register users" do
      signup_helper
      expect(page).to have_content("Test")
  end

  it "can create a new short with vanity string" do
      login_helper

      click_link("Dashboard")

      create_new_short

      expect(page).to have_content("http://127.0.0.1")
    end

    it "list links by current user" do
      login_helper

      click_link("Dashboard")

      expect(page).to have_content("Shortr Links")
    end
end
