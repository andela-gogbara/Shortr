require "rails_helper"

describe "Statistics", js: true do
  before(:all) do
    @user = FactoryGirl.create(:user, password: "password")
  end
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end
  context "Anonymous Users" do
    it "allow anonymous users to see list of influential users" do
      visit root_path
      expect(page).to have_content("Top Users")
    end
  end

  context "Registered Users" do
    before do
      login_helper(@user.email, "password")
    end

    it "allow registered users to access their links detail page" do
      create_new_short("http://facebook.com")

      page.all(".collection")[0].click

      expect(page).to have_content("Facebook")
    end

    it "allow current user to see stats about each link visit" do
      click_link(page.all(".collection-item")[0].find("a").text)

      expect(page).to have_content("IP Address")
    end
  end
end
