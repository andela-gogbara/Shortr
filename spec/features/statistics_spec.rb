require "rails_helper"

describe "Statistics", js: true do
  it "allow anonymous users to see list of influential users" do
    visit root_path
    expect(page).to have_content("Top Users")
    # TODO: Improve this
  end

  it "allow registered users to access their links detail page" do
    signup_helper

    create_new_short

    page.all(".collection")[0].click

    expect(page).to have_content("facebook")
  end

  it "allow current user to see stats about each link visit" do
    login_helper

    click_link("Dashboard")
    click_link(page.all(".collection-item")[0].find("span").text)
    # click_link ("Visit Link")

    expect(page).to have_content("IP Address")
  end
end
