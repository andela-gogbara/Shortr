require "rails_helper"

RSpec.describe Statistic, type: :model do
  subject { FactoryGirl.create(:link) }
  let(:stats) { FactoryGirl.create(:statistic)}

  it { should belong_to(:user) }

  describe "#format_date" do
    it "should return date in the correct format" do
      time = Time.now.strftime("%m/%d/%Y")
      expect(stats.format_date).to eq(time)
    end
  end
end
