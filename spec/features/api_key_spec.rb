require "rails_helper"

describe "API KEY", js: true do
  before(:all) do
    @user = create(:user, password: "password")
  end

  after(:all) do
    Link.destroy_all
    User.destroy_all
  end

  it "allows registered users to see their API Key" do
    login_helper(@user.email, "password")
    click_link("API KEY")
    expect(page).to have_content("This is your personal API key")
  end
end
