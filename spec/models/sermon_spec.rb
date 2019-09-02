require 'rails_helper'

RSpec.describe Sermon, type: :model do
  
  describe "self.search" do
    before(:each) do
      FactoryBot.create(:sermon, :speaker_marty, :verse_exodus)
      FactoryBot.create(:sermon, :title_test_sermon)
      FactoryBot.create(:sermon, :oct312018, :verse_matthew_28)
      FactoryBot.create(:sermon, :aug202017, :verse_matthew_eph)
    end

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

    it "finds correct results by year" do
      results = Sermon.search({ year: "2018" })
      expect(results.count).to eq(1)
      results.each do |r|
        expect(r.date.year).to eq(2018)
      end
    end
    
    it "finds correct results by month" do
      results = Sermon.search({ month: "8" })
      expect(results.count).to eq(1)
      results.each do |r|
        expect(r.date.month).to eq(8)
      end
    end

    it "finds correct results by verse with only book" do
      results = Sermon.search({verses: "Matthew"})
      expect(results.count).to eq(2)
      results.each do |r|
        expect(Pericope.new(r.verses).to_s).to include("Matthew")
      end
    end

    it "finds correct results by verse with book and chapter" do
      results = Sermon.search({verses: "Matthew 28"})
      expect(results.count).to eq(1)
      results.each do |r|
        expect(Pericope.new(r.verses).to_s).to include("Matthew")
      end
    end
  end

  pending "Sermons search should find all sermons when combining criteria" 
end
