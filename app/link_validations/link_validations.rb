class LinkValidations
  def initialize(link, request = nil)
    @link = link
    @request = request
  end

  def valid_link_action
    @link.visit_count += 1
    @link.save
    @link.statistics.create(get_visit_details)
  end

  def link_error_message
    return check_active? unless @link.active
    return check_deleted? if @link.deleted
  end

  def check_active?
    flash[:error] = "Link made inactive by owner"
  end

  def check_deleted?
    flash[:error] = "Link has been deleted by owner"
  end

  def get_visit_details
    user_agent = UserAgent.parse(@request.env["HTTP_USER_AGENT"])
    {
      ip: @request.ip,
      browser: user_agent.browser,
      os: user_agent.platform,
    }
  end
end
