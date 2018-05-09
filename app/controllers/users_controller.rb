class UsersController < ApplicationController
  before_action(:get_user, only:[:show, :edit, :update, :destroy])



  def show
    #@upcoming_events = Event.where("user_id = ?", @user.id).order("date ASC")
    @upcoming_events = User.joins("INNER JOIN user_events ON user_events.user_id = users.id")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to sign_up_path
    end
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

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation)
  end

  def upcoming_events
    @user.events.sort_by
  end

  def get_user
    @user = User.find(params[:id])
  end
end
