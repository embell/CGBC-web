# Sermons model. Use this to work with file and data pertaining to a recording.
class Sermon < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :speaker
  validates_presence_of :date
  validates_presence_of :audio_file

  mount_uploader :audio_file, SermonUploader

  def self.search(title, speaker)
    matches = Sermon.all
    if title
      matches = matches.where("title LIKE ?", "%#{title}%")
    end

    if speaker && !speaker.empty?
      matches = matches.where("speaker LIKE ?", "#{speaker}")
    end

    matches
  end

  def day
    date.day
  end

  def month
    date.month
  end

  def year
    date.year
  end
end
