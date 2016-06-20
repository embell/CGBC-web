require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe 'GET #index' do
    it 'redirects to Login view when not logged in' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    pending "login and verify that admin index is shown"
    # it 'renders admin page when logged in' do
      # get :index
      # expect(response).to render_template :index
    # end
  end
end
