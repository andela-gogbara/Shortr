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
      format.js { render :new_short_form }
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
    @dd = Link.new(link_params)
    @dd.save
    perform(@dd.id)
    # if @new_link.save
    #   # flash[:link_saved] = "Link saved"
    # end
    # byebug
      new_create_redirect
      flash[:success] = root_url + @dd.short_url
  end

  def show
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
      redirect_to @link.full_url
    else
      @link = Link.find(params[:id])
      respond_to do |format|
        format.js { render :show_link }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:delete_success] = "Delete Success"
    redirect_to current_user
  end

  def link_params
    params.require(:link).permit(:full_url, :short_url, :active, :user_id)
    # byebug
  end

  def new_create_redirect
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def perform(link_id)
  link = Link.find(link_id)
  user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
  agent = Mechanize.new
  page = agent.get(link.full_url)
  byebug
  link.title = page.title
  link.save
  end

end
