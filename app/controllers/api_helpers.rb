module ApiHelpers
  def process_action_callback(status, status_info, short_url)
    render json: { status: status, status_info: status_info,
                   short_url: root_url + short_url }
  end
end
