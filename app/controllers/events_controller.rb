class EventsController < ApplicationController
  before_action(:get_event, only:[:show, :edit, :update, :destroy, :join_event, :leave_event])
  before_action(:get_recipes, only: [:new, :create, :edit, :update])

  def index
    if !logged_in
      redirect_to log_in_path
    end
    @events = Event.all
  end

  def show
    if !logged_in
      redirect_to log_in_path
    end
    @user = User.find(session[:user_id])
  end

  def new
    if !logged_in
      redirect_to log_in_path
    end
    @event = Event.new
    @recipes = User.find(session[:user_id]).recipes
    @user = User.find(session[:user_id])
  end

  def create
    @event = Event.new(event_params)

    if @event.valid?
      @event.save
      @event.users << User.find(session[:user_id])
      redirect_to user_path(User.find(session[:user_id]))
    else
      flash[:error] = @event.errors.full_messages
      render :new
    end
  end

  def edit
    if !logged_in
      redirect_to log_in_path
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      flash[:error] = @event.errors.full_messages
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event has been deleted. Go home to create a new event"
    redirect_to events_path
  end

  def join_event
    flash[:notice] = "Joined Event"
    @event.users << User.find(session[:user_id])
    redirect_to events_path
  end

  def leave_event
    flash[:notice] = "Left Event"
    @event.users.delete(User.find(session[:user_id]))
    redirect_to events_path
  end

  private

  def get_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :location, :date, :details, recipe_ids: [])
  end

  def get_recipes
    @user = User.find(session[:user_id])
    @recipes = @user.recipes
  end
end
