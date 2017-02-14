class Event < ActiveRecord::Base
  # Get all events planned for future, as well as recent (w/in last week) events
  def self.recent_and_upcoming
    Event.where("date > :last_week", last_week: 7.days.ago)
  end
end
