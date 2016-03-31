require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Asssociations" do
    it { should have_many(:links)}
  end

  describe "Validations" do
      it { should validate_presence_of(:name)}
      it { should validate_presence_of(:email)}
      it { should validate_presence_of(:password)}
  end

  describe "User Scopes" do
    it "returns top users" do
      user = FactoryGirl.build(:user)
      link = FactoryGirl.create(:link, user_id: user.id)
      expect((User.top_users).first).to eql(user)
    end
  end




end
