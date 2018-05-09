class SessionsController < ApplicationController
  def new
    if logged_in
      redirect_to user_path(session[:user_id])
    end
  end

  def welcome
    if logged_in
      redirect_to user_path(session[:user_id])
    end
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = ["Oops! Your username and/or password was incorrect."]
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to log_in_path
  end
end
