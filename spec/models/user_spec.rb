require "rails_helper"

RSpec.describe User, type: :model do
  describe "instance methods" do
    context "respond to instance method calls" do
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:email) }
      it { is_expected.to respond_to(:link_id) }
      it { is_expected.to respond_to(:api_key) }
    end
  end

  describe "Asssociations" do
    it { should have_many(:links) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "User Scopes" do
    it "returns top users" do
      user = create(:user)
      create(:link, user_id: user.id)
      expect(User.top_users.first).to eql(user)
    end
  end
end
