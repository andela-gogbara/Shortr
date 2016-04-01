module Shortr
  module Test
    module Helpers
      def signup_helper
        visit signup_path
        fill_in "Name", with: "Test User"
        fill_in "Email", with: "sengodwin@gmail.com"
        fill_in "Password", with: "testtest"
        fill_in "Password confirmation", with: "testtest"

        click_button "Create Account"
      end

      def login_helper
        visit login_path
        fill_in "Email", with: "sengodwin@gmail.com"
        fill_in "Password", with: "testtest"

        click_button "Sign In"
      end

      def create_new_short
        click_link("Create Shortr")
        fill_in("link_full_url", with: "http://facebook.com")
        fill_in("link_short_url", with: "face")
        click_button("Make Shortr")
      end
    end
  end
end
