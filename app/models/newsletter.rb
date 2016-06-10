# Class for Newsletter. Essentially, this should be a pdf file and some metadata.
class Newsletter < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :document

  mount_uploader :document, NewsletterUploader

  def month
    date.month
  end

  def year
    date.year
  end
end
