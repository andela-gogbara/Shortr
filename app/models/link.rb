class Link < ActiveRecord::Base
  belongs_to :user
  has_many :statistics
  validates :full_url, presence: true, url: true
  before_create :link_shortener
  def link_shortener
    if self.short_url.nil? || self.short_url.eql?("")
    self.short_url = SecureRandom.urlsafe_base64(5)
    end
  end

scope :most_popular, lambda {
  where(deleted: false).order("visit_count desc").limit(5)
}

scope :recent_links, lambda {
  where(deleted: false).order("created_at desc").limit(5)
}

end
