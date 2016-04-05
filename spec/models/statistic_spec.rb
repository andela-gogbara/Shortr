require "rails_helper"

RSpec.describe Statistic, type: :model do
  subject { FactoryGirl.create(:link) }
  it { should belong_to(:user) }
end
