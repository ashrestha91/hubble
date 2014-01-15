class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.all.inject({}) do |acc, event|
      acc[event] = LinkThumbnailer.generate(event.url)
      acc
    end
  end

  def create
    Event.create(event_params)

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:url, :description, :date, :start_time)
  end
end
