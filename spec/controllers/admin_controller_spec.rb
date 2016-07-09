require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe 'GET #index' do
    describe 'logged off' do
      it 'redirects to Login view' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'logged on' do
      login_with_permissions(['newsletter'])
      it 'renders admin page' do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
