require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    FactoryGirl.create(:event, :past)
    FactoryGirl.create(:event, :future)
    FactoryGirl.create(:event, :today)
    FactoryGirl.create(:event, :past)
    FactoryGirl.create(:event, :last_week)
    FactoryGirl.create(:event, :past)
    FactoryGirl.create(:event, :yesterday)
    FactoryGirl.create(:event, :yesterday)
  end

  describe "self.upcoming" do
    it "finds recent and upcoming events that occur today and after" do
      results = Event.upcoming()

      results.each do |r|
        expect(r.date).to be > Date.yesterday
      end
    end

    it "does not find events that occur before today" do
      all_events = Event.all
      results = Event.upcoming()

      events_not_found = all_events - results

      events_not_found.each do |e|
        expect(e.date).to be < Date.today
      end
    end

  end
end
