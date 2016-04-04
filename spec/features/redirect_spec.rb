require "rails_helper"

describe "Redirect after link editing", js: true do
  after(:all) do
    Link.destroy_all
  end

  it "can accept new vanity string when editing" do
      signup_helper("Jamie Vardy", "t@t.com", "test")
      create_new_short("http://example.com", "short")
      click_link(page.all(".collection-item")[0].find("span").text)
      click_link("EDIT")
      fill_in("link_short_url", with: "new_vanity")
      click_button("Save Changes")
      expect(page).to have_content("Updated Successfully")
      click_link(page.all(".collection-item")[0].find("span").text)
      click_link("Visit Link")
      expect(page).to have_content("Example Domain")
  end
end
