class EventsController < ApplicationController
  def index
    @event = Event.new(default_event)
    @events = Event.all
  end

  def create
    Event.create(event_params)

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
    params.require(:event).permit(:url, :description, :date, :start_time)
  end
end
