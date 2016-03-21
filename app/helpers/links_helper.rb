module LinksHelper

  def link_owner
    if current_user
      current_user.id
    else
      nil
    end
  end
end
