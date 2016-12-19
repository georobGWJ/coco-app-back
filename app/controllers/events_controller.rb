class EventsController < ApplicationController

  def index
    render json: Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(params[:user_id])
    @sat = Sat.where(location_name: params[:location_name], date: params[:date]).first
    @event = Event.new(user_id: @user.id, sat_id: @sat.id, completed: false)

    if @event.save
      event_information = {
        name: @user.first_name,
        phone_number: @user.phone_number,
        date: @sat.date.to_s,
        location: @sat.location_name
            }

      ReminderJob.set(wait: 1.minute).perform_later(event_information)
      ReminderJob.set(wait: 3.minutes).perform_later(event_information)

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: {}, status: 200 }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: ErrorSerializer.serialize(@event.errors), status: 422 }
    end
  end

  def show
    render json: Event.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def event_params
  end

end

# date: "2017-06-03"
# location_name: "YUCAIPA HS"

    # p '*******' * 20
    # p @user.id
    # p '*******' * 20
