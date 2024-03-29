# Controller for admin page(s). Require authentication, detemine permissions
class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = 'Administration'

    user = current_user
    if user.permissions.include?(:newsletters)
      @show_newsletter_fields = true
      @all_newsletters = Newsletter.all.sort.reverse.map { |nl| [nl.name, nl.id] }
    end

    if user.permissions.include?(:sermons)
      @show_sermon_fields = true
      @all_sermons = Sermon.all.sort.reverse.map { |s| [s.title, s.id] }
    end

    if user.permissions.include?(:articles)
      @show_article_fields = true
      @all_articles = Article.all.sort.reverse.map { |a| [a.title, a.id] }
    end

    if user.permissions.include?(:events)
      @show_event_fields = true
      @all_events = Event.all.sort.reverse.map { |a| [a.name, a.id] }
    end
  end
end
