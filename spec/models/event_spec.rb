require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    FactoryGirl.create(:event, :past)
    FactoryGirl.create(:event, :future)
    FactoryGirl.create(:event, :past)
  end

  describe "self.recent_and_upcoming" do
    it "finds recent and upcoming events" do
      results = Event.recent_and_upcoming()

      results.each do |r|
        expect(r.date).to be > 7.days.ago
      end
    end
  end
end
