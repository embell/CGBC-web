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
