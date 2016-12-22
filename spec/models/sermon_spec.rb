require 'rails_helper'

RSpec.describe Sermon, type: :model do
  FactoryGirl.create(:sermon, :speaker_marty)
  FactoryGirl.create(:sermon, :title_test_sermon)
  
  describe "self.search" do
    it "finds correct results by title" do
      results = Sermon.search({ title: "Test" })
      expect(results.count).to eq(1)
      results.each do |r|
        expect(r.title).to include("Test")
      end
    end
    
    it "finds correct results by speaker" do
      results = Sermon.search({ speaker: "Marty Grainger" })
      expect(results.count).to eq(1)
      results.each do |r|
        expect(r.speaker).to include("Marty")
      end
    end
  end

  pending "Sermons search should find all sermons by year" 
  pending "Sermons search should find all sermons by month" 
  pending "Sermons search should find all sermons when combining all criteria" 
end
