require "rails_helper"

RSpec.describe LinksHelper, type: :helper do
  let(:link) { create(:link) }
  let(:user) { create(:user) }
  before :each do
    @helper = Object.new.extend LinksHelper
  end

  describe "#link_title" do
    context "link has no valid title" do
      it "should return title of the page" do
        with_title = create(:link, full_url: "http://example.com")
        expect(helper.link_title(with_title)).to eq("http://example.com")
      end
    end
  end

  describe "#link_owner" do
    context "registered user" do
      it "should return current_user id" do
        expect(helper.link_owner).to eq(user.id)
      end
    end

    context "anonymous user" do
      it "should return current_user id" do
        expect(helper.link_owner).to eq(nil)
      end
    end
  end
end
