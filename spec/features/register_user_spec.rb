require "rails_helper"

describe "Registered Users", js: true do
  before(:all) do
    @user = FactoryGirl.create(:user, password: "password")
  end
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end

  it "can create a new short with vanity string" do
    login_helper(@user.email, "password")
    create_new_short("New shortr link created")

    expect(page).to have_content("http://127.0.0.1")
  end

  it "list links by current user" do
    login_helper(@user.email, "password")

    expect(page).to have_content("Shortr Links")
  end
end
