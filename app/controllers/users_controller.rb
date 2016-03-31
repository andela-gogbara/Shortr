class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Registration successful"
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def show_api
    @user = User.find(current_user)
    respond_to do |format|
      format.js { render :api_key }
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :api_key)
  end
end
