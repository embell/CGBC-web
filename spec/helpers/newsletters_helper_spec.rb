require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the NewslettersHelper. For example:
#
# describe SermonsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe NewsletterHelper, type: :helper do
  describe "get_newsletter_name" do
    it "gets newsletter name in MMM YYYY format" do
      date = Time.new(2016, 3)
      name = get_newsletter_name(date)
      expect(name).to eq("Mar 2016")
    end
  end
end
