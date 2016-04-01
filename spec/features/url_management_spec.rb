require "rails_helper"

describe "URL Management", js: true do
  after(:all) do
    Link.destroy_all
    User.destroy_all
  end
  it "allows redistered users to edit their short urls" do
    signup_helper
    create_new_short
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("EDIT")
    fill_in("link_short_url", with: "new_vanity")
    click_button("Save Changes")
    expect(page).to have_content("Updated Successfully")
  end


  it "allows registered users to edit their delete their links" do
    login_helper
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("DELETE")
    expect(page).to have_content("Deleted Successfully")
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("Visit Link")
    expect(page).to have_content("Link has been deleted by owner")
  end

end
