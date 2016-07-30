# Controller for sermons.
class SermonsController < ApplicationController
  before_filter :authenticate_user!, only: :create

  def index
    @title = 'Sermons'
    @speakers = Sermon.distinct.pluck(:speaker)

    if params[:title] || params[:speaker]
      @sermons = Sermon.search(params[:title], params[:speaker])
    else
      @sermons = Sermon.all
    end
  end

  def create
    @sermon = Sermon.new(sermon_params)

    if @sermon.save
      redirect_to '/sermons'
    else
      flash[:error] = 'Sermon cannot be created: '
      @sermon.errors.full_messages.each do |err|
        flash[:error] += err
      end
      redirect_to '/admin'
    end
  end

  def sermon_params
    params.require(:sermon).permit(:title, :speaker, :date, :audio_file)
  end
end
