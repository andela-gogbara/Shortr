require "rails_helper"

describe "Registered Users", js: true do
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end

  it "allows users to create account" do
      signup_helper
      expect(page).to have_content("Registration successful")
  end

  it "can create a new short with vanity string" do
      login_helper

      create_new_short

      expect(page).to have_content("http://127.0.0.1")
    end

    it "list links by current user" do
      login_helper

      expect(page).to have_content("Shortr Links")
    end
end
