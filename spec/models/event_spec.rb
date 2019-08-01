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
    FactoryBot.create(:event, :next_year)
    FactoryBot.create(:event, :last_year)
    FactoryBot.create(:event, :ends_next_month)
    FactoryBot.create(:event, :ends_this_month)
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

  describe "self.month_events" do
    # Test that no false positives are returned
    it "finds events only for the given month" do
      results = Event.month_events(Date.today.year, Date.today.month)

      results.each do |e|
        start_in_month = false
        end_in_month = false

        start_in_month = (e.start_date.month == Date.today.month &&
                          e.start_date.year == Date.today.year) 
        end_in_month = !e.end_date.nil? && 
                       (e.end_date.month == Date.today.month &&
                        e.end_date.year == Date.today.year)

        if e.end_date.nil? 
          date_range_string = "#{e.start_date}"
        else
          date_range_string = "range #{e.start_date} - #{e.end_date}"
        end

        expect(start_in_month || end_in_month).to be == true, "Date #{date_range_string} not in month #{Date.today.month} of #{Date.today.year}"
      end
    end

    # Test for false negatives
    it "finds all events for a given month" do
      results = Event.month_events(Date.today.year, Date.today.month)
      all_events = Event.all

      # if event is not in the results, make sure it shouldn't be
      all_events.reject { |e| results.include?(e) }.each do |e| 
        
        start_in_month = (e.start_date.month == Date.today.month &&
                          e.start_date.year == Date.today.year) 
        end_in_month = !e.end_date.nil? && 
                       (e.end_date.month == Date.today.month &&
                        e.end_date.year == Date.today.year)

        if e.end_date.nil? 
          date_range_string = "#{e.start_date}"
        else
          date_range_string = "#{e.start_date} - #{e.end_date}"
        end

        expect(start_in_month || end_in_month).to be == false, "Event on #{date_range_string} should have been returned."
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
