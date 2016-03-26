class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @newsletter = Newsletter.new

    @newsletter_permission = true
    @sermons = true
    @test = true
  end
end
