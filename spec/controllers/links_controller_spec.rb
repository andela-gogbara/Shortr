require "rails_helper"

RSpec.describe LinksController, type: :controller, js: true do
  subject{ FactoryGirl.create(:link)}
  let(:user) { FactoryGirl.create(:user)}

  describe "GET new" do
    before do
      xhr :get, :new, format: :js
    end
    it { is_expected.to render_template "links/new_short_form" }
  end

  describe "GET edit" do
    before do
      xhr :get, :edit, id: subject, format: :js
    end
    it { is_expected.to render_template "links/edit_short_form" }
  end

  describe "POST create" do
    before(:each) do
      session[:user_id] = user.id
    end

    before do
      post :create, link: FactoryGirl.attributes_for(:link)
    end

    it "increase link count by 1" do
      expect{
        post :create, link: FactoryGirl.attributes_for(:link)
      }.to change(Link, :count).by(1)
    end

    it "it should set flash message" do
      expect(flash[:success]).to eq("http://test.host/shortr")
    end

  context "when user is signed in" do

    it "is expected user will be redirect to user profile page" do
      expect(response).to redirect_to(user_path(user))
    end
    it { is_expected.to redirect_to(user_path(user)) }
  end


  end

  describe "PUT update" do
    before(:each) do
      session[:user_id] = user.id
    end

    context "with valid data" do
      let(:valid_data) { FactoryGirl.attributes_for(:link, full_url: "full_url", short_url: "short_url") }
      before do
        put :update, id: subject, link: valid_data
      end
      it { is_expected.to redirect_to(user_path(user))}
      it "it is expected to set flash message" do
        expect(flash[:success]).to eq("Updated Successfully")
      end
    end
  end

  describe "GET show" do
    before do
      xhr :get, :show, id: subject, format: :js
    end
    it { is_expected.to render_template "links/show_link" }
  end
end
