require 'rails_helper'

# Test the Newsletter model
RSpec.describe Newsletter, type: :model do
  describe "self.get_default_name" do
    it "gets default newsletter name in MMM YYYY format" do
      date = Time.new(2016, 3)
      name = Newsletter.get_default_name(date)
      expect(name).to eq("Mar 2016")
    end
  end
end
