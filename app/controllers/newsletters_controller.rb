# Controller to handle newsletter requests
class NewslettersController < ApplicationController
  before_filter :authenticate_user!, only: :create

  def index
    @title = "Newsletter"
    @news_by_year = {}
    Newsletter.find_each do |n|
      if @news_by_year.keys.include? n.year
        @news_by_year[n.year].push n
      else
        @news_by_year.store(n.year, [n])
      end
    end
    @news_by_year = @news_by_year.sort_by {|year, newsletters| year}.reverse
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    unless @newsletter.name
      @newsletter.name = view_context.get_newsletter_name(@newsletter.date)
    end

    if @newsletter.save
      redirect_to '/newsletter'
    else
      flash[:error] = "Newsletter entry invalid: "
      @newsletter.errors.full_messages.each do |err|
        flash[:error] += err
      end
      redirect_to '/admin'
    end
  end

  def newsletter_params
    params.require(:newsletter).permit(:name, :date, :document) 
  end
end
