# Sermons model. Use this to work with file and data pertaining to a recording.
class Sermon < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :speaker
  validates_presence_of :date
  validates_presence_of :audio_file

  mount_uploader :audio_file, SermonUploader

  def self.search(params)
    # Start with everything, narrow down based on params
    matches = Sermon.all

    if params[:title]
      matches = matches.where("title LIKE ?", "%#{params[:title]}%")
    end

    if params[:speaker] && !params[:speaker].empty?
      matches = matches.where("speaker LIKE ?", "#{params[:speaker]}")
    end
    
    if params[:year] && !params[:year].empty?
      year = DateTime.new(params[:year].to_i)
      year_begin = year.beginning_of_year.prev_day
      year_end = year.end_of_year
      
      matches = matches.where("date >= ? AND date <= ?", year_begin, year_end)
    end
    
    if params[:month] && !params[:month].empty?
      month = params[:month]
      if ENV['RAILS_ENV'] == 'production'
        matches = matches.where('extract(month FROM date) = ?', month)
      elsif ENV['RAILS_ENV'] == 'development'
        matches = matches.where("cast(strftime('%m', date) as int) = ?", month)
      end
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
