class Newsletter < ActiveRecord::Base
  mount_uploader :document, NewsletterUploader

  def month

  end

  def year

  end

  def file

  end
end
