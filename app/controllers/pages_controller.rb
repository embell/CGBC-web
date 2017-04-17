# Controller to direct to basic pages
class PagesController < ApplicationController
  def home
    @last_sermon = Sermon.last
    @last_newsletter = Newsletter.last
    @upcoming_events = Event.upcoming
  end

  def history
    @title = 'Beliefs'
  end

  def history
    @title = 'History'
  end

  def contact
    @title = 'Contact'
  end

  def letsencrypt
    render text: "CG__wcFN5HBF3wdt4715kV_ZC8dlsipOuAcomh6DiLI.8irEjcOIniTce4WuxcUwZtD9I8faf7-2HkDE5UsG6UM"
  end
end
