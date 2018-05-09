class ApplicationController < ActionController::Base
  helper_method :logged_in
  helper_method :current_user
  # before_action :authorized, only: []
  before_action :user

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in
    !!current_user
  end

  def authorized
    redirect_to log_in_path unless logged_in
  end

  def user
    @nav_user = current_user
  end
end
