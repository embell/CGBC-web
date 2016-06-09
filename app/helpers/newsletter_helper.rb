# Heler methods for Newsletter resources
module NewsletterHelper
  # Name for newletters is MMM YYYY
  def get_newsletter_name(date)
    month = date.month
    month = ((1..12).cover? month) ? Date::MONTHNAMES[month] : month

    "#{month} #{date.year}"
  end
end
