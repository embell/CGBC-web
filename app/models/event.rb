class Event < ActiveRecord::Base
  # Get all events planned for today and after
  def self.upcoming
    upcoming_events = Event.where("start_date > :yesterday", yesterday: Date.today.advance(days: -1))
    upcoming_events.order(start_date: :asc)
  end

  # Find all events for a particular month on the calendar.
  def self.month_events(year, month)
    return Event.where("(start_date >= '#{Date.new(year, month, 1)}' " +
                       "AND start_date <= '#{Date.new(year, month, -1)}') " + 
                       "OR (end_date >= '#{Date.new(year, month, 1)}' " +
                       "AND end_date <= '#{Date.new(year, month, -1)}') ")  
  end

  def formatted_start_date
    start_date.strftime("%b %e")
  end

  def formatted_end_date
    end_date.strftime("%b %e")
  end
end
