class WelcomeController < ApplicationController
  include LinksHelper
  def message
    @link = Link.new
    @most_popular = Link.most_popular
    @recent_links = Link.recent_links
    @top_users = User.top_users
  end
end
