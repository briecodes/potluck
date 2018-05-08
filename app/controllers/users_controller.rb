class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

      if @user.valid?
        redirect_to @user
      else
        flash[:errors] = @user.errors.full_messages
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation, recipes: [])
  end


end
