require "rails_helper"

describe Api::LinksController do
  before(:all) do
    @link = create(:link, short_url: "short")
    @user = create(:user)
  end

  describe "#create" do
    context "Anonymous user" do
      before do
        create_request("http://facebook.com")
      end

      it "expected a success message" do
        expect(json["status_info"]).to eq("Successfully created new short")
      end

      it "should return status code" do
        expect(response.response_code).to eq(200)
      end
    end

    context "Registered User" do
      before do
        create_request("http://facebook.com", "vanity", @user.api_key)
      end

      it "should expect a success message" do
        expect(json["status_info"]).to eq("Successfully created new short")
      end

      it "should return status code" do
        expect(response.response_code).to eq(200)
      end

      it "should retrieve newly created short url" do
        expect(json["short_url"]).to eq("http://test.host/vanity")
      end

      it "should increase user link count" do
        expect(@user.links.count).to eq(2)
      end
    end

    context "link to shorten no valid" do
      before do
        post :create, link: { full_url: "http:facebook.com" }, format: :json
        create_request("http:facebook.com")
      end

      it "should return invalid format error message" do
        expect(json["status_info"]).to eq("Please use the correct link format")
      end
    end

    context "Vanity string already exist" do
      before do
        post :create, link: { full_url: "http://facebook.com",
                              short_url: "short",
                              api_key: @user.api_key }, format: :json
      end
      it "should show error message if vanity exist" do
        expect(json["status_info"]).to eq("Could not create new short")
      end
    end
  end

  describe "#update" do
    context "user does not have a valid token" do
      before do
        update_request(@link, "vanity", @link.short_url)
      end

      it "should return no token error" do
        expect(json["status_info"]).to eql("You need a valid API Key to update a link")
      end
    end

    context "user has valid token" do
      before do
        update_request(@link, "vanity", @link.short_url, @user.api_key)
      end

      it "should return success message" do
        expect(json["status_info"]).to eq("Successfully edited your short")
      end

      it "should retrieve newly created short url" do
        expect(json["short_url"]).to eq("http://test.host/vanity")
      end
    end

    context "vanity string already exist" do
      before(:all) do
        FactoryGirl.create(:link, short_url: "existing")
      end
      before do
        update_request(@link, "existing", @link.short_url, @user.api_key)
      end

      it "should return update error message" do
        expect(json["status_info"]).to eq("Could not edit content")
      end
    end
  end

  # describe "#most_popular", type: :request, format: :json do
  #   it "should return the most popular links" do
  #   get "/api/most-popular"
  #     expect(response).to eq("test")
  #   end
  # end
end
