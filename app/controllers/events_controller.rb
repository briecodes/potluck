class EventsController < ApplicationController
  before_action(:get_event, only:[:show, :edit, :update, :destroy, :join_event, :leave_event])

  def index
    if !logged_in
      #redirect_to login_page
    end
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.valid?
      @event.save
      @event.users << User.find(session[:user_id])
      redirect_to events_path
    else
      flash[:error] = @event.errors.full_messages
      render :new
    end
  end

  def edit
    #If the user logged_in and !!!
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
    flash[:notice] = "Event has been deleted. Go to self page to create a new event"
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
    params.require(:event).permit(:title, :location, :date, :details)
  end
end
