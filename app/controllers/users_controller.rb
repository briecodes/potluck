class UsersController < ApplicationController
  before_action(:get_user, only:[:show, :edit, :update, :destroy])

  def show
    #@upcoming_events = Event.where("user_id = ?", @user.id).order("date ASC")
    @upcoming_events = User.joins("INNER JOIN user_events ON user_events.user_id = users.id")
    @recipes = User.find(session[:user_id]).recipes[0..2]
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user.destroy
    session.delete(:user_id)
    flash[:notice] = "You account has been deleted from Potluck. Create a new account to continue using our application"
    #redirect_to login_path
  end

  private

  def upcoming_events
    @user.events.sort_by
  end

  def get_user
    @user = User.find(params[:id])
  end
end
