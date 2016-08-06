# Controller to direct to basic pages
class PagesController < ApplicationController
  def home
  end

  def history
    @title = 'History'
  end

  def contact
    @title = 'Contact'
  end
end
