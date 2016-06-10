require 'rails_helper'

# Test any helper methods related to the Newsletter controller
RSpec.describe NewsletterHelper, type: :helper do
  describe "get_newsletter_name" do
    it "gets newsletter name in MMM YYYY format" do
      date = Time.new(2016, 3)
      name = get_newsletter_name(date)
      expect(name).to eq("Mar 2016")
    end
  end
end
