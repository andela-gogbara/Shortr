require "rails_helper"

RSpec.describe LinksController, type: :controller, js: true do
  before(:all) do
    @link = create(:link)
  end

  let(:user) { create(:user) }

  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  describe "GET new" do
    it "renders new short form template" do
      xhr :get, :new, format: :js
      expect(response).to render_template("links/new_short_form")
    end
  end

  describe "GET edit" do
    it "renders edit form template" do
      session[:user_id] = user.id
      xhr :get, :edit, id: @link, format: :js
      expect(response).to render_template("links/edit_short_form")
    end
  end

  describe "POST create" do
    before(:each) do
      session[:user_id] = user.id
    end

    before do
      post :create, link: attributes_for(:link, short_url: "plus")
    end

    it "increase link count by 1" do
      expect do
        post :create, link: attributes_for(:link, short_url: "tested")
      end.to change(Link, :count).by(1)
    end

    it "it should set flash message" do
      expect(flash[:link]).to eq("http://test.host/plus")
    end

    context "when user is signed in" do
      it "expects user to be redirect to the user profile page" do
        expect(response).to redirect_to(user_path(user))
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      session[:user_id] = user.id
    end

    context "with valid data" do
      let(:valid_data) { attributes_for(:link, full_url: "full_url", short_url: "short_url") }

      before do
        put :update, id: @link, link: valid_data
      end

      it { is_expected.to redirect_to(user_path(user)) }

      it "should set flash message" do
        expect(flash[:success]).to eq("Updated Successfully")
      end
    end
  end

  describe "GET show" do
    it "renders show link template" do
      xhr :get, :show, id: @link, format: :js
      expect(response).to render_template("links/show_link")
    end
  end
end
