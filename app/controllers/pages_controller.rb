# Controller to direct to basic pages
class PagesController < ApplicationController
  def home
    @last_sermon = Sermon.last
    @last_newsletter = Newsletter.last
  end

  def history
    @title = 'History'
  end

  def contact
    @title = 'Contact'
  end
end
