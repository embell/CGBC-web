# Controller for sermons.
class SermonsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :validate_permission, only: [:create, :destroy]

  def index
    @title = 'Sermons'
    @speakers = Sermon.distinct.pluck(:speaker)

    @all_years = Sermon.distinct.pluck(:date)
    @all_years.map!(&:year).uniq!

    search_params = params.select do |key, _|
      [:title, :speaker, :year, :month].include?(key.to_sym)
    end

    @sermons = search_params.any? ? Sermon.search(search_params) : Sermon.all
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

  def destroy
    s = Sermon.find(sermon_params[:id])
    deleted_title = s.title

    s.destroy

    flash[:success] = "Deleted sermon '#{deleted_title}'."
    redirect_to '/admin'
  end

  def sermon_params
    params.require(:sermon).permit(:id, :title, :speaker, :date, :audio_file)
  end

  # TODO: This function is redudant with same function in newsletter controller. Combine these.
  def validate_permission
    unless current_user.permissions.include?(:sermons)
      flash[:error] = 'You do not have permission to edit Sermons.'
      redirect_to '/admin'
    end
  end
end
