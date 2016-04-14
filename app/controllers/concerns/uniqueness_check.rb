module UniquenessCheck
  extend ActiveSupport::Concern

  def check_link_uniqueness
      flash[:error] = "Link already taken"
      new_create_redirect
  end

  def unique_vanity?(link)
    link.short_url != params[:link][:short_url]
  end

  def unique_link?
    Link.find_by(short_url: params[:link][:short_url])
  end

  def new_create_redirect
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end
end
