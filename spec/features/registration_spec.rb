require "rails_helper"

describe "User Registration", js: true do
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end
  context "with valid registration to details" do
    before do
      signup_helper("James Longo", "test1@test.com", "test")
    end
    it "should show user a welcome message" do
    expect(page).to have_content("Registration successful")
    end
  end

  context "with invalid registration details" do
    before do
      signup_helper("James Longo", "", "test")
    end

    it "should return form error" do
      expect(page).to have_content("Email can't be blank")
    end
  end
end
