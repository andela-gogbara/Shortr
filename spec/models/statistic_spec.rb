require "rails_helper"

RSpec.describe Statistic, type: :model do
  subject { create(:link) }
  let(:stats) { create(:statistic) }

  it { should belong_to(:user) }

  describe "#format_date" do
    it "should return date in the correct format" do
      time = stats.created_at.strftime("%m/%d/%Y")
      expect(stats.format_date).to eq(time)
    end
  end
end
