# Controller to handle newsletter requests
class NewslettersController < ApplicationController
  before_filter :authenticate_user!, only: :create

  def index
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    unless @newsletter.name
      @newsletter.name = view_context.get_newsletter_name(@newsletter.date)
    end

    if @newsletter.save
      redirect_to '/newsletter'
    end
  end

  def newsletter_params
    params.require(:newsletter).permit(:name, :date, :file_path) 
  end
end
