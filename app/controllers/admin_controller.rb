class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @newsletter = true
    @sermons = true
    @test = true
  end
end
