class LinksController < ApplicationController
  def index
    @links = Link.all
  end

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
  if @link.update_attributes(link_params)
    flash[:update_success] = "Success Update"
    redirect_to current_user
  else
    render 'edit'
  end
end



  def create
    @link = Link.new(link_params)
    if Link.find_by(short_url: params[:link][:short_url])
      flash[:error] = "Link taken"
      new_create_redirect
    else
      @link.save
      # TitleWorker.perform_async(@link.id)
      new_create_redirect
      flash[:success] = root_url + @link.short_url
    end
    # if @new_link.save
    #   # flash[:link_saved] = "Link saved"
    # end
    # byebug
  end

  # def check_short_uniqueness
  #   if Link.find_by(short_url: params[:link][:short_url])
  #     flash[:error] = "Link taken"
  #     new_create_redirect
  #   end
  # end

  def get_visit_details
    user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
    user_details = {}
    user_details[:ip] = request.ip
    user_details[:browser] = user_agent.browser
    user_details[:os] = user_agent.platform
    user_details
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

  def check_active_delete
    if @link.active && @link.deleted == true
      redirect_to @link.full_url
      @link.visit_count += 1
      byebug
      @link.statistics.create(get_visit_details)
      @link.save
    else
      link_error_message
    end
  end

  def link_error_message
    return check_active? unless @link.active
    return check_deleted? if @link.deleted
  end

  def check_active?
      flash[:link_exist] = "Link made inactive by owner"
      new_create_redirect
  end

  def check_deleted?
      flash[:link_deleted] = "Link made deleted by owner"
      new_create_redirect
  end


  def destroy
    @link = Link.find(params[:id])
    @link.deleted = true
    flash[:success] = "Delete Success"
    @link.save
    redirect_to current_user
  end

  def link_params
    params.require(:link).permit(:full_url, :short_url, :active, :user_id)
  end

  def new_create_redirect
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

end
