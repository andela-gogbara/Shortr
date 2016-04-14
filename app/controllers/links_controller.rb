class LinksController < ApplicationController
  include UniquenessCheck
  before_action :authenticate_user!, only: [:edit, :destroy]

  def new
    @link = Link.new
    respond_to do |format|
      format.js { render :new_short_form }
    end
  end

  def edit
    @link = Link.find(params[:id])
    respond_to do |format|
      format.js { render :edit_short_form }
    end
  end

  def update
    @link = Link.find(params[:id])
    return check_link_uniqueness if unique_link? && unique_vanity?(@link)
    if @link.update_attributes(link_params)
      flash[:success] = "Updated Successfully"
      redirect_to current_user
    end
  end

  def create
    @link = Link.new(link_params)
    return check_link_uniqueness if unique_link?
    @link.save
    get_title(@link.id)
    flash[:success] = "New shortr link created"
    flash[:link] = root_url + @link.short_url
    new_create_redirect
  end

  def show
    @link = Link.find(params[:id])
    respond_to do |format|
      format.js { render :show_link }
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.deleted = true
    @link.save
    flash[:success] = "Deleted Successfully"
    redirect_to current_user
  end

  protected

  def link_params
    params.require(:link).permit(:full_url, :short_url, :active, :user_id)
  end

  def get_title(link_id)
    link = Link.find(link_id)
    agent = Mechanize.new
    page = agent.get(link.full_url)
    link.title = page.title
    link.save
  rescue
    flash[:error] = "Could not retrive title"
  end
end
