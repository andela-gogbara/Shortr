require "rails_helper"

describe "URL Management", js: true do
  before(:all) do
    @user = create(:user, password: "password")
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
      create_new_short("http://example.com", "short")
      click_link(page.all(".collection-item")[0].find("a").text)
      click_link("EDIT")
      fill_in("link_short_url", with: "new_vanity")
      click_button("Save Changes")
      expect(page).to have_content("Updated Successfully")
    end

    it "should prevent users from updating with string that already exist" do
      create_new_short("http://google.com", "short")
      click_link(page.all(".collection-item")[0].find("a").text)
      click_link("EDIT")
      fill_in("link_short_url", with: "new_vanity")
      click_button("Save Changes")
      expect(page).to have_content("Link already taken")
    end

    it "allows registered users to edit their delete links" do
      click_link(page.all(".collection-item")[0].find("a").text)
      click_link("DELETE")
      expect(page).to have_content("Deleted Successfully")
    end
  end
end
