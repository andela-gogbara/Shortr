class LinksController < ApplicationController
  def index
    @links = Link.all
  end



  def create
    @dd = Link.new(link_params)
    @dd.save
    # if @new_link.save
    #   # flash[:link_saved] = "Link saved"
    # end
    # byebug
      redirect_to root_path
      flash[:success] = root_url + @dd.short_url
  end

  def show
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
      redirect_to @link.full_url
      # byebug
    end
  end

  def link_params
    params.require(:link).permit(:full_url, :short_url, :active)
    # byebug
  end
end
