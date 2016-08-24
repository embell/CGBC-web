# Controller to handle newsletter requests
class NewslettersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
  before_action :validate_permission, only: [:create, :destroy, :edit, :update]

  def index
    @title = 'Newsletter'
    @news_by_year = {}
    Newsletter.find_each do |n|
      if @news_by_year.keys.include? n.year
        @news_by_year[n.year].push n
      else
        @news_by_year.store(n.year, [n])
      end
    end
    @news_by_year = Hash[@news_by_year.sort_by { |year, _| year }.reverse]
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      redirect_to '/newsletters'
    else
      flash[:error] = 'Newsletter entry invalid: '
      @newsletter.errors.full_messages.each do |err|
        flash[:error] += err
      end
      redirect_to '/admin'
    end
  end

  def edit
    @newsletter = Newsletter.find(newsletter_params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    @newsletter.update(newsletter_params)
    redirect_to '/newsletters'
  end

  def newsletter_params
    params.require(:newsletter).permit(:id, :name, :date, :document)
  end

  def destroy
    n = Newsletter.find(params[:id])
    deleted_name = n.name
    n.destroy

    flash[:success] = "Deleted newsletter '#{deleted_name}'."
    redirect_to '/admin'
  end

  def validate_permission
    unless current_user.permissions.include?(:newsletters)
      flash[:error] = 'You do not have permission to edit Newsletters.'
      redirect_to '/admin'
    end
  end
end
