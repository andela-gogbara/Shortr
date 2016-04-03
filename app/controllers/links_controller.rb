class LinksController < ApplicationController
  include LinksHelper

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
    return if check_short_uniqueness_update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "Updated Successfully"
      redirect_to current_user
    else
      render "edit"
    end
end

  def create
    @link = Link.new(link_params)
    # return if check_short_uniqueness_create
    @link.save
    # TitleWorker.perform_async(@link.id)
    # TODO: Add correct flash message
    flash[:success] = root_url + @link.short_url
    new_create_redirect
  end

  def show
    @link = Link.find(params[:id])
    respond_to do |format|
      format.js { render :show_link }
    end
  end

  def process_url
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
      check_active_delete
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.deleted = true
    @link.save
    flash[:success] = "Deleted Successfully"
    redirect_to current_user
  end

  private

  def link_params
    params.require(:link).permit(:full_url, :short_url, :active, :user_id)
  end
end
