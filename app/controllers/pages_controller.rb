# Controller to direct to basic pages
class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:change_video]

  def home
    @last_sermon = Sermon.last
    @last_newsletter = Newsletter.last
    @upcoming_events = Event.upcoming

    flash[:warning] = "To protect the health of our members and the public during the pandemic, " + 
                      "we are cancelling normal services. However, you can continue to worship "  +
                      "with us: on Sunday morning at 11AM each week, we will stream service on Facebook Live."
  end

  def beliefs
    @title = 'Beliefs'
  end

  def history
    @title = 'History'
  end

  def contact
    @title = 'Contact'
  end

  def change_video
    params.require(:id)
    video_id = params[:id]
    if File.exists?('youtube.txt')
      begin
        File.write('youtube.txt', video_id)
        redirect_to '/'
      rescue
        flash[:error] = 'Error updating video.'
        redirect_to '/admin'
      end
    end
  end

  def letsencrypt
    render text: "#{params[:id]}.8irEjcOIniTce4WuxcUwZtD9I8faf7-2HkDE5UsG6UM"
  end
end
