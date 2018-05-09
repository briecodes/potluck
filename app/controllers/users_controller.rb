class UsersController < ApplicationController
  before_action(:get_user, only:[:show, :edit, :update, :destroy])

  def index
    @user = User.find(session[:user_id])
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(session[:user_id])
    #@upcoming_events = Event.where("user_id = ?", @user.id).order("date ASC")
    # Ahamed, the following can be used: @upcoming_events = @user.events
    @events = @user.events
    @recipes = @user.recipes[0..2]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
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
    redirect_to log_in_path
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
