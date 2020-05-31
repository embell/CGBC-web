# Controller to direct to basic pages
class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:change_video]

  def home
    @last_sermon = Sermon.last
    @last_newsletter = Newsletter.last
    @upcoming_events = Event.upcoming

    flash[:warning] = "We are now open for Sunday morning worship service. We ask that attendees please continue to maintain social " + 
                      "distancing. We'll also still be livestreaming services on Facebook and uploading them to Youtube, so feel free to join us online if preferred."
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
