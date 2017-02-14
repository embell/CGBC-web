require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    FactoryGirl.create(:event, :past)
    FactoryGirl.create(:event, :future)
    FactoryGirl.create(:event, :past)
  end

  describe "self.upcoming" do
    results = Event.upcoming()
    
    results.each do |r|
      expect(r.date).to be > Time.now
    end
  end
end
