require "rails_helper"

describe "URL Management", js: true do
  it "allows redistered users to create account" do
    signup_helper
    click_link("Dashboard")
    create_new_short
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("EDIT")
    fill_in("link_short_url", with: "new_vanity")
    click_button("Save Changes")
    expect(page).to have_content("Updated Successfully")
    click_link(page.all(".collection-item")[0].find("span").text)
    # click_link("Visit Link")
    expect(current_url).to eql("http://www.facebook.com")
  end

  it "allows registered users to edit their link to inactive" do
    login_helper
    click_link("Dashboard")
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("EDIT")
    # byebug
    within(:css, ".activity") do
      choose("false")
    end
    # find('div.activity').choose('Inactive')
    # choose('Inactive')
    click_button("Save Changes")
    expect(page).to have_content("Updated Successfully")
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("Visit Link")
    expect(page).to have_content("Link made inactive by owner")
  end
  it "allows registered users to edit their link to inactive" do
    login_helper
    click_link("Dashboard")
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("EDIT")
    # byebug
    within(:css, ".activity") do
      choose("false")
    end
    # find('div.activity').choose('Inactive')
    # choose('Inactive')
    click_button("Save Changes")
    expect(page).to have_content("Updated Successfully")
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("Visit Link")
    expect(page).to have_content("Link made inactive by owner")
  end

  it "allows registered users to edit their delete their links" do
    login_helper
    click_link("Dashboard")
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("DELETE")
    expect(page).to have_content("Deleted Successfully")
    click_link(page.all(".collection-item")[0].find("span").text)
    click_link("Visit Link")
    expect(page).to have_content("Link has been deleted by owner")
  end

end
