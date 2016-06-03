class Newsletter < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :document

  mount_uploader :document, NewsletterUploader

  def month

  end

  def year

  end

  def file

  end
end
