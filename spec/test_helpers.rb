module Shortr
  module Test
    module Helpers
      def signup_helper(name, email, password)
        visit signup_path
        fill_in "Name", with: name
        fill_in "Email", with: email
        fill_in "Password", with: password
        fill_in "Password confirmation", with: password

        click_button "Create Account"
      end

      def login_helper(email, password)
        visit login_path
        fill_in "Email", with: email
        fill_in "Password", with: password

        click_button "Sign In"
      end

      def create_new_short(full_url, vanity_string = nil)
        click_link("Create Shortr")
        fill_in("link_full_url", with: full_url)
        fill_in("link_short_url", with: vanity_string)
        click_button("Make Shortr")
      end
    end
  end
end
