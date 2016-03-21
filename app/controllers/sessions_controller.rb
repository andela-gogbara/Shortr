class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url,
      notice: "Welcome back"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url,
    notice: "See You Again"
  end
end
