require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    FactoryBot.create(:event, :past)
    FactoryBot.create(:event, :today)
    FactoryBot.create(:event, :future)
    FactoryBot.create(:event, :today)
    FactoryBot.create(:event, :past)
    FactoryBot.create(:event, :last_week)
    FactoryBot.create(:event, :past)
    FactoryBot.create(:event, :yesterday)
    FactoryBot.create(:event, :yesterday)
  end

  describe "self.upcoming" do
    it "finds recent and upcoming events that occur today and after" do
      results = Event.upcoming()

      results.each do |r|
        expect(r.start_date).to be > Date.today.advance(days: -1)
      end
    end

    it "does not find events that occur before today" do
      all_events = Event.all
      results = Event.upcoming()

      events_not_found = all_events - results

      events_not_found.each do |e|
        expect(e.start_date).to be < Date.today
      end
    end

    it "returns upcoming events sorted by soonest first" do
      results = Event.upcoming()

      results.slice(0, results.size-1).each_with_index do |r, i|
        expect(r.start_date).to be <= results[i+1].start_date
      end
    end

  end

  describe "formatted_start_date" do
    it "returns start date in MMM DD format" do
      e = Event.new(start_date: Date.today)
      expect(e.formatted_start_date).to eq(Date.today.strftime("%b %e"))
    end
  end

  describe "formatted_end_date" do
    it "returns end date in MMM DD format" do
      e = Event.new(end_date: Date.today)
      expect(e.formatted_end_date).to eq(Date.today.strftime("%b %e"))
    end
  end
end
