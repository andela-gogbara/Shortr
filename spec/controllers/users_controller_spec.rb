require "rails_helper"

RSpec.describe UsersController, type: :controller do
  after(:all) do
    User.destroy_all
  end
  let(:user_one) { FactoryGirl.create(:user, name: "test", email: "tes@test.com", password: "test") }
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
    let(:new_user) { FactoryGirl.attributes_for(:user) }
    # it "redirects user" do
    #   post :create, new_user: FactoryGirl.attributes_for(:user)
    #   expect(response).to redirect_to(user_path(assigns[:new_user]))
    # end

    context "creates account with valid data" do
      it "creates a new achievement in the database" do
        expect do
          post :create, user: new_user
        end.to change(User, :count).by(1)
      end
    end

    # context "does not creates account with invalid data" do
    #   it "creates a new achievement in the database" do
    #       invalid_user = FactoryGirl.create(:user)
    #     expect{
    #       post :create, user: invalid_user
    #     }.to change(User, :count).by(0)
    #   end
    # end
  end
end
