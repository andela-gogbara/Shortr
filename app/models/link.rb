class Link < ActiveRecord::Base
  belongs_to :user
  has_many :statistics, dependent: :destroy
  validates :full_url, presence: true
  # validates :short_url, presence: true
  before_create :link_shortener

  def link_shortener
    if short_url.nil? || short_url.eql?("")
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
