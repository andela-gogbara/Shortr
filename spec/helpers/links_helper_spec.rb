require "rails_helper"

RSpec.describe LinksHelper, type: :helper do
  let(:link) { create(:link) }

  describe "#link_title" do
    context "link has no valid title" do
      it "should return title of the page" do
        with_title = create(:link, full_url: "http://example.com")
        expect(helper.link_title(with_title)).to eq("http://example.com")
      end
    end
  end
end
