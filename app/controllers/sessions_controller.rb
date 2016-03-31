class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back"
      redirect_to user_path(current_user)
      else
        flash[:error] = "Invalid Email or Password"
        render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "See You Soon"
    redirect_to root_url
  end
end
