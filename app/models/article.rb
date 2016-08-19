# Represents an article that's a part of the pastor's blog.
class Article < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :text

  after_validation do |article|
    article.text = article.text.strip
    article.date = Date.today
  end
end
