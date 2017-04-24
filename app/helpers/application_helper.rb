# Use this module for utility methods useful throughout the application.
module ApplicationHelper
  # This helper gets the title for a page. Combines passed info (if any) with base title, "CGBC"
  def get_page_title(sub_title)
    home_title = "Cedar Grove Baptist Church"
    base_title = "CGBC"
    sub_title.nil? || sub_title.empty? ? home_title : "#{base_title} - #{sub_title}" 
  end
end
