module LinksHelper

  def link_owner
    if current_user
      current_user.id
    else
      nil
    end
  end

  def check_short_uniqueness
    if Link.find_by(short_url: params[:link][:short_url])
      flash[:error] = "Link already taken"
      new_create_redirect
    end
  end

  def check_active_delete
    if @link.active && @link.deleted == false
      @link.visit_count += 1
      @link.save
      @link.statistics.create(get_visit_details)
      redirect_to @link.full_url
    else
      link_error_message
    end
  end

  def link_error_message
    return check_active? unless @link.active
    return check_deleted? if @link.deleted
  end

  def check_active?
      flash[:error] = "Link made inactive by owner",
      new_create_redirect
  end

  def check_deleted?
      flash[:error] = "Link has been deleted by owner"
      new_create_redirect
  end

  def new_create_redirect
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def get_visit_details
    user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
    user_details = {}
    user_details[:ip] = request.ip
    user_details[:browser] = user_agent.browser
    user_details[:os] = user_agent.platform
    user_details
  end
end
