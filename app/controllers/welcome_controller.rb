class WelcomeController < ApplicationController
  include LinksHelper
  def message
    @dd = Link.new
  end
end
