require "rails_helper"

RSpec.describe UsersController, type: :controller do
  after(:all) do
    User.destroy_all
  end
  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  let(:user_one) { create(:user, name: "test", email: "tes@test.com", password: "test") }
  describe "new account creation" do
    before do
      get :new
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :new }
  end

  describe "GET show" do
    before do
      get :show, id: user_one
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :show }
  end

  describe "POST create" do
    let(:new_user) { attributes_for(:user) }

    context "creates account with valid data" do
      it "creates a new achievement in the database" do
        expect do
          post :create, user: new_user
        end.to change(User, :count).by(1)
      end
    end

    context "does not creates account with invalid data" do
      before do
        invalid_user = attributes_for(:user, email: "")
        post :create, user: invalid_user
      end

      it "creates a new achievement in the database" do
        expect do
        end.to change(User, :count).by(0)
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#show_api" do
    before do
      session[:user_id] = user_one.id
    end
    it "assigns an api key to new users" do
      xhr :get, :show_api, id: user_one, format: :js
      expect(response).to render_template("users/api_key")
    end
  end
end
