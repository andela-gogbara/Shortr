require "api_helpers"
class ApplicationController < ActionController::Base
  include ApiHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if:
  proc { |c| c.request.format == "application/json" }

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def current_user_with_token
    @api_user = User.find_by(api_key: params[:link][:api_key]) if
    params[:link][:api_key]
  end

  helper_method :current_user_with_token

  def authenticate_user_with_token!
    process_action_callback(400, "You need a valid API Key to update a link",
                            "") unless current_user_with_token
  end
end
