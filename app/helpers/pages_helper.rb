# Helper methods for any of several mostly static pages
module PagesHelper
  def read_video_id
    if File.exists?('youtube.txt')
      video_id = File.read('youtube.txt', 11)
    end

    # In case something goes wrong, return a default video.
    if video_id.nil? || video_id.length < 11
      video_id =  "uHpiMjXX5ts"
    end

    return video_id
  end
end
