# Controller for admin page(s). Require authentication, detemine permissions
class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = 'Administration'
    @user = current_user
  end
end
