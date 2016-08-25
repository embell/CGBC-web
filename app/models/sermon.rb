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
      matches = matches.where('title LIKE ?', "%#{params[:title]}%")
    end

    if params[:speaker] && !params[:speaker].empty?
      matches = matches.where('speaker LIKE ?', params[:speaker].to_s)
    end

    if params[:year] && !params[:year].empty?
      year = DateTime.new(params[:year].to_i)
      year_begin = year.beginning_of_year.prev_day
      year_end = year.end_of_year

      matches = matches.where('date >= ? AND date <= ?', year_begin, year_end)
    end

    if params[:month] && !params[:month].empty?
      month = params[:month]
      if ENV['RAILS_ENV'] == 'production'
        matches = matches.where('extract(month FROM date) = ?', month)
      elsif ENV['RAILS_ENV'] == 'development'
        matches = matches.where("cast(strftime('%m', date) as int) = ?", month)
      end
    end

    matches = matches.to_a
    
    if params[:verses] && !params[:verses].empty?
      matches.keep_if do |match|
        next if match.verses.nil?

        searched_verse = get_pericope(params[:verses])
        if searched_verse.nil?
          matches = []
          break
        end

        sermon_verses = Pericope.parse(match.verses)

        found = false
        sermon_verses.each do |s| 
          found = true if searched_verse.intersects?(s) 
        end

        found
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

  # Go from a string to a Pericope. Using this method, can interpret book names alone as Pericopes.
  def self.get_pericope(verse_string)
    pericope = Pericope.new(verse_string)  
  rescue RuntimeError
    begin
      pericope = Pericope.new(verse_string + " 1")
      book_count = pericope.book_chapter_count
      pericope = Pericope.new(verse_string + " 1-#{book_count}")
    rescue RuntimeError
      nil 
    end
  end

  # When comparing, use date to determine order
  def <=>(other)
    date <=> other.date
  end
end
