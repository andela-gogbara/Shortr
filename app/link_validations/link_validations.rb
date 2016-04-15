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

  def get_visit_details
    user_agent = UserAgent.parse(@request.env["HTTP_USER_AGENT"])
    {
      ip: @request.ip,
      browser: user_agent.browser,
      os: user_agent.platform,
    }
  end
end
