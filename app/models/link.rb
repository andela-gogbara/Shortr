class Link < ActiveRecord::Base
  belongs_to :user
  validates :full_url, presence: true
  before_create :link_shortener
  def link_shortener
    self.short_url = SecureRandom.urlsafe_base64(5)
  end
  # byebug


end
