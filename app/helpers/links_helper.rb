module LinksHelper
  def link_owner
    current_user.id if current_user
  end

  def link_title(link)
    link.title || link.full_url[0..45]
  end
end
