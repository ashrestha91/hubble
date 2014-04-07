class EventsController < ApplicationController
  def index
    @event = Event.new(default_event)
    @events = Event.chronologically
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event created!"
    else
      flash[:error] = "Error: Could not save Event. Please check your event"
    end

    redirect_to events_path
  end

  def destroy
    Event.find(params[:id]).destroy

    redirect_to events_path
  end

  private

  def default_event
    {
      date: Date.today,
      start_time: Time.now.midnight
    }
  end

  def event_params
    params.require(:event).permit(:title, :url, :description, :date, :start_time)
  end
end
