require 'rails_helper'

# Test any helper methods related to the overall application
RSpec.describe ApplicationHelper, type: :helper do
  describe "get_page_title" do
    it "gets correct page title when given non-empty input" do
      title = get_page_title("Home")
      expect(title).to eq("CGBC - Home")
    end

    it "gets correct page title when given non-truthy input" do
      title = get_page_title(nil)
      expect(title).to eq("Cedar Grove Baptist Church")
    end

    it "gets correct page title when given empty input" do
      title = get_page_title("")
      expect(title).to eq("Cedar Grove Baptist Church")
    end
  end
end
