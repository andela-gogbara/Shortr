require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "POST create" do
    before(:all) do
      @valid_user = FactoryGirl.create(:user)
    end

    after(:all) { DatabaseCleaner.clean_with(:truncation) }
    
    context "with valid login details" do
      before(:each) do
        login_details = { email: "testuser@example.com", password: "password"}
        get :create, user: login_details
      end
      it "renders template new" do
        expect(response).to render_template(:new)
      end
      it "set's flash message" do
        expect(flash[:error]).to eq("Invalid Email or Password")
      end
    end
  end

  describe "#destroy" do
    before(:each) do
      get :destroy
    end
    it "session id will be null" do
      expect(session[:user_id]).to eq(nil)
    end

    it "set's flash message" do
      expect(flash[:success]).to eq("See You Soon")
    end
  end
end
