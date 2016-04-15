module UniquenessCheck
  extend ActiveSupport::Concern

  def invalid_link_action
    flash[:error] = "Link already taken"
    redirect_user
  end

  def unique_vanity?(link)
    link.short_url != params[:link][:short_url]
  end

  def unique_link?
    Link.find_by(short_url: params[:link][:short_url])
  end

  def redirect_user
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end
end
