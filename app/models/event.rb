class Event < ActiveRecord::Base
  # Get all events planned for today and after
  def self.upcoming
    Event.where("start_date > :today", today: 1.days.ago)
  end
end
