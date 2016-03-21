class Link < ActiveRecord::Base
  before_create :link_shortener

  def link_shortener
    self.short_url = SecureRandom.urlsafe_base64(5)
  end
  # byebug


end
