require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user, password: "testtest")}
  describe "new account creation" do
    before do
      get :new
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :new }
  end

  describe "GET show" do
    before do
      get :show, id: user
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :show }
  end

  describe "POST create" do
    let(:new_user) { FactoryGirl.attributes_for(:user)}
    it "redirects user" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to(root_path)
    end

    it "creates a new achievement in the database" do
      expect{
        post :create, user: new_user
      }.to change(User, :count).by(1)
    end
  end
end
