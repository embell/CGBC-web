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
    render text: "wFTe3eNI4RerkDwlO7l5a6CeHDGMe7AsB8JNIveJtUY.8irEjcOIniTce4WuxcUwZtD9I8faf7-2HkDE5UsG6UM"
  end
end
