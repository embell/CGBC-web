class Newsletter < ActiveRecord::Base
  mount_uploader :file, NewsletterUploader

  def month

  end

  def year

  end

  def file

  end
end
