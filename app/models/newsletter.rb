# Class for Newsletter. Essentially, this should be a pdf file and some metadata.
class Newsletter < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :document

  before_validation :default_name

  mount_uploader :document, NewsletterUploader

  # If name isn't passed in explicitly, determine from date
  def default_name
    self.name ||= self.class.get_default_name(date)
  end

  # Name for newsletters, by default, is MMM YYY
  def self.get_default_name(new_date)
    month = new_date.month
    month = ((1..12).cover? month) ? Date::MONTHNAMES[month] : month

    "#{month[0..2]} #{new_date.year}"
  end

  def month
    date.month
  end

  def year
    date.year
  end

  # When comparing, use date to determine ordering
  def <=>(other)
    date <=> other.date
  end
end
