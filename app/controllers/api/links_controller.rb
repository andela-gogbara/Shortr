module Api
  class LinksController < ApplicationController
      include LinksHelper
    respond_to :json
    before_action :validate_url, only: [:update, :create]
    before_action :authenticate_user_with_token!, only: [:update]

    def index
      @links = Link.all
      respond_with @links
    end

    def create
      unless @link = Link.find_by(short_url: params[:link][:short_url])
        create_new_action
        process_action_callback(201, "Successfully created new short", create_new_action.short_url)
      else
        process_action_callback(500, "Could not create new short", "")
      end
    end

    def update
      unless @link = Link.find_by(short_url: params[:old]) && !Link.find_by(short_url: params[:link][:short_url])
        process_action_callback(500, "Could not edit content", "")
      else
      link = Link.find_by(short_url: params[:old])
      link.update(update_params)
      process_action_callback(201, "Successfully created edit short", link.short_url)
    end
  end

    def most_popular
      @most_popular = Link.most_popular
      respond_with @most_popular
    end

private
    def link_params
      params.require(:link).permit(:full_url, :short_url, :active)
    end

    def update_params
      params.require(:link).permit(:short_url, :active, :deleted)
    end

    def create_new_action
      if current_user_with_token
        current_user_with_token.links.create(link_params)
      else
        Link.create(link_params)
      end
    end

    def validate_url
      reg_exp = %r{\A(https?:\/\/)?([a-z0-9]+\.)?[a-z0-9\-]+\.[a-z]+.+[^\W\_]\z}
      unless reg_exp.match(params[:link][:full_url])
        process_action_callback(500, "Please use the correct link format", "")
      end
    end

  end
end
