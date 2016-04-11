require "rails_helper"

describe "Signin Process", js: true do
  before(:all) do
    @user = create(:user, password: "password")
  end
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end
  context "with valid data" do
    before do
      login_helper(@user.email, "password")
    end
    it "should show welcome back message" do
      expect(page).to have_content("Welcome back")
    end
  end

  context "with invalid data" do
    before do
      login_helper(@user.email, "pass")
    end
    it "should show error message" do
      expect(page).to have_content("Invalid Email or Password")
    end
  end
end
