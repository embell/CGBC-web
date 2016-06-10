# Use this module for utility methods useful throughout the application.
module ApplicationHelper
  # This helper gets the title for a page. Combines passed in info (if any) with base title, "CGBC"
  def get_title(sub_title)
    base_title = "CGBC"
    sub_title ? "#{base_title} - #{sub_title}" : base_title
  end
end
