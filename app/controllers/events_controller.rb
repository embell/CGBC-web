# Controller for Events
class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :validate_permission, only: [:create, :edit, :update, :destroy]

  def index 
    if ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'].include?(params['month'])
      @month = params['month']
    else
      @month = Date.today().month
    end

    if /20[0-9]{2}$/.match?(params['year'])
      @year = params['year']
    else
      @year = Date.today().year
    end

    @month = Integer(@month)
    @year = Integer(@year)

    if @month == 12
      @next_month = 1
      @next_year = @year+1
    else
      @next_month = @month+1
      @next_year = @year
    end

    if @month == 1
      @prev_month = 12
      @prev_year = @year-1
    else
      @prev_month = @month-1
      @prev_year = @year
    end

    @title = 'Events'
    @month_events = Event.month_events(@year, @month)
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = 'Successfully created event.'
      redirect_to '/admin'
      ChangeLog.write("==== New Event created ====
                       created by: #{current_user.email}
                       #{@event.inspect}\n")
    else
      flash[:error] = 'Event entry invalid: '
      @event.errors.full_messages.each do |err|
        flash[:error] += err
      end
      redirect_to '/admin'
    end
  end

  def edit
    @event = Event.find(event_params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to '/admin'
    
    ChangeLog.write("==== Event updated ====
                       changed by: #{current_user.email}
                       #{@event.inspect}\n")
  end

  def destroy
    a = Event.find(params[:id])
    deleted_name = a.name
    deleted_info = a.inspect

    a.destroy

    flash[:success] = "Deleted event '#{deleted_name}'."
    redirect_to '/admin'

    ChangeLog.write("==== Event DELETED ====
                       removed by: #{current_user.email}
                       #{deleted_info}\n")
  end

  def event_params
    params.require(:event).permit(:id, :name, :start_date, :end_date, :description)
  end

  # TODO: This function is redundant with same one in other resource controllers. Figure out where to define it.
  def validate_permission
    unless current_user.permissions.include?(:events)
      flash[:error] = 'You do not have permission to edit Events.'
      redirect_to '/admin'
    end
  end
end
