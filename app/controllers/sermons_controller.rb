require 'will_paginate/array'

# Controller for sermons.
class SermonsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :validate_permission, only: [:create, :edit, :update, :destroy]

  def index
    @title = 'Sermons'
    @speakers = Sermon.distinct.pluck(:speaker)

    @all_years = Sermon.distinct.pluck(:date)
    @all_years.map!(&:year).uniq!

    search_params = params.select do |key, _|
      [:title, :speaker, :verses, :year, :month].include?(key.to_sym)
    end

    if search_params.any?
      @sermons = Sermon.search(search_params)
      @show_clear = true
      if @sermons.empty?
        flash.now[:error] = ['Found no sermons matching these search criteria: ']
        search_params.each do |key, val|
          flash[:error] << "#{key.capitalize} - #{val}" unless val.blank?
        end
        @sermons = Sermon.all
      end
    else
      @sermons = Sermon.all
      @show_clear = false
    end

    # Show newest Sermons first
    @sermons = @sermons.sort.reverse.paginate(page: params[:page], per_page: 1)
  end

  def create
    @sermon = Sermon.new(sermon_params)

    if @sermon.save
      redirect_to '/sermons'
      ChangeLog.write("==== New Sermon created ====
                       created by: #{current_user.email}
                       #{@sermon.inspect}\n")
    else
      flash[:error] = 'Sermon cannot be created: '
      @sermon.errors.full_messages.each do |err|
        flash[:error] += err
      end
      redirect_to '/admin'
    end
  end

  def edit
    @sermon = Sermon.find(sermon_params[:id])
  end
  
  def show
    @sermon = Sermon.find(params[:id])
    render '_show'
  end

  def update
    @sermon = Sermon.find(params[:id])    
    @sermon.update(sermon_params)
    redirect_to '/sermons'

    ChangeLog.write("==== Sermon updated ====
                       changed by: #{current_user.email}
                       #{@sermon.inspect}\n")
  end

  def destroy
    s = Sermon.find(params[:id])
    deleted_title = s.title
    deleted_info = s.inspect

    s.destroy

    flash[:success] = "Deleted sermon '#{deleted_title}'."
    redirect_to '/admin'

    ChangeLog.write("==== Sermon DELETED ====
                       removed by: #{current_user.email}
                       #{deleted_info}\n")
  end

  def sermon_params
    params.require(:sermon).permit(:id, :title, :speaker, :verses, :date, :audio_file)
  end

  # TODO: This function is redudant with same function in newsletter controller. Combine these.
  def validate_permission
    unless current_user.permissions.include?(:sermons)
      flash[:error] = 'You do not have permission to edit Sermons.'
      redirect_to '/admin'
    end
  end
end
