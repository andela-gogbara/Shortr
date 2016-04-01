require "rails_helper"

RSpec.describe LinksController, type: :controller, js: true do
  describe "GET new" do
    before do
      xhr :get, :new, format: :js
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template "links/new_short_form" }
  end
end
