require "rails_helper"

RSpec.describe Link, type: :model do
  let(:link) { FactoryGirl.create(:link) }

  describe "Asssociations" do
    it { should belong_to :user }
  end

  describe "Validations" do
    it { should validate_presence_of(:full_url) }

    # it { should validate_presence_of(:short_url) }
  end

  describe "Links Scope" do
    let(:popular_link) { FactoryGirl.create(:link) }
    it "returns most_popular links" do
      popular_link.visit_count += 3
      popular_link.save
      expect(Link.most_popular.first).to eq(popular_link)
    end

    it "returns recent links" do
      recent_link = FactoryGirl.create(:link)
      expect(Link.recent_links.first).to eq(recent_link)
    end
  end

  describe '#link_shortener' do
    it "returns a hexadecimal string" do
      link = Link.new
      expect(link.link_shortener.length).to eql 7
    end
  end
end
