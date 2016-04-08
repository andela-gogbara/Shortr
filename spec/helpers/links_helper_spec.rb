require "rails_helper"

# Specs in this file have access to a helper object that includes
# the LinksHelper. For example:
#
# describe LinksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
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
