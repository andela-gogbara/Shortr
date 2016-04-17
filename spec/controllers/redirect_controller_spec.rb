require "rails_helper"

RSpec.describe RedirectController, type: :request do
  context "when link is active" do
    it "should redirect user to original url" do
      link = create(:link)
      get "/#{link.short_url}"
      expect(response).to redirect_to("http://www.facebook.com")
    end
  end

  context "when link is inactive" do
    before do
      link = create(:link, short_url: "inactive", active: false)
      get "/#{link.short_url}"
    end

    it "should show the user an inactive link error message" do
      expect(flash[:error]).to eq("Link made inactive by owner")
    end

    it "should redirect user to homepage" do
      expect(response).to redirect_to("/")
    end
  end

  context "when link has been deleted" do
    before do
      link = create(:link, short_url: "deleted", deleted: true)
      get "/#{link.short_url}"
    end

    it "should show the user a link deleted error message" do
      expect(flash[:error]).to eq("Link has been deleted by owner")
    end

    it "should redirect user to homepage" do
      expect(response).to redirect_to("/")
    end
  end
end
