require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  describe "POST create" do
    before(:all) do
      @valid_user = create(:user, email: "test@test.com", password: "test")
    end

    context "with valid login details" do
      before(:each) do
        post :create, email: @valid_user.email, password: @valid_user.password
      end

      it "should set session id" do
        expect(session[:user_id]).to eq(@valid_user.id)
      end

      it "should redirect user to user page" do
        expect(response).to redirect_to("http://test.host/users/1")
      end

      it "set's flash message" do
        expect(flash[:success]).to eq("Welcome back")
      end
    end

    context "with invalid login details" do
      before(:each) do
        login_details = { email: "testuser@example.com", password: "password" }
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
