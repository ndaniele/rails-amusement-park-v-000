class SessionsController < ApplicationController
  def new
    @users = User.all 
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome back to the theme park!"
    else
      render signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "You have been logged out successfully"
  end
  
end
