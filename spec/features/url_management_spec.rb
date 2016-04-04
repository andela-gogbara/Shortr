require "rails_helper"

describe "URL Management", js: true do
  before(:all) do
    @user = FactoryGirl.create(:user, password: "password")
  end
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end
  context "Registered Users" do
    before do
      login_helper(@user.email, "password")
    end
    it "allows redistered users to edit their short urls" do
      create_new_short("http://facebook.com", "short")
      click_link(page.all(".collection-item")[0].find("span").text)
      click_link("EDIT")
      fill_in("link_short_url", with: "new_vanity")
      click_button("Save Changes")
      expect(page).to have_content("Updated Successfully")
    end

    it "allows registered users to edit their delete their links" do
      click_link(page.all(".collection-item")[0].find("span").text)
      click_link("DELETE")
      expect(page).to have_content("Deleted Successfully")
      click_link(page.all(".collection-item")[0].find("span").text)
      click_link("Visit Link")
      expect(page).to have_content("Link has been deleted by owner")
    end

    it "allows registered users to set their link to inactive" do
      create_new_short("http://facebook.com", "short")
      click_link(page.all(".collection-item")[1].find("span").text)
      click_link("EDIT")
      find(".inactive-text").click
      click_button("Save Changes")
      click_link(page.all(".collection-item")[1].find("span").text)
      click_link("Visit Link")
      expect(page).to have_content("Link made inactive by owner")
    end

    it "should show error message if short already exist" do
      create_new_short("http://facebook.com", "short")
      expect(page).to have_content("Link already taken")
    end

    it "should prevent users from updating with string that already exist" do
      click_link(page.all(".collection-item")[0].find("span").text)
      click_link("EDIT")
      fill_in("link_short_url", with: "short")
      click_button("Save Changes")
      expect(page).to have_content("Link already taken")
    end
  end
end
