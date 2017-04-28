class Event < ActiveRecord::Base
  # Get all events planned for today and after
  def self.upcoming
    Event.where("start_date > :yesterday", yesterday: Date.today.advance(days: -1))
  end

  def formatted_start_date
    start_date.strftime("%b %e")
  end

  def formatted_end_date
    end_date.strftime("%b %e")
  end
end
