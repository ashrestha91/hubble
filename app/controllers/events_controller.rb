class EventsController < ApplicationController
  def index
    @event = Event.new
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

  def event_params
    params.require(:event).permit(:url, :description, :date, :start_time)
  end
end
