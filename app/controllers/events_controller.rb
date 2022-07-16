class EventsController < ApplicationController 
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path(@event), notice: "L'évènement a bien été créé"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to events_path(@event), notice: "L'évènement a bien été mis à jour"
  end

  def destroy
    @event.destroy
    redirect_to events_path(@event), notice: "L'évènement a bien été supprimé"
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
