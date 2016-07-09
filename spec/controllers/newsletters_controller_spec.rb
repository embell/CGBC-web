require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do
  describe 'GET #index' do
    it 'renders the Newsletters index' do
      get :index
      expect(response).to render_template :index
    end
  end

  pending "Adding new newsletters only works when logged in with correct permission"
  #describe '#create' do
    #describe 'logged off' do
      ## Try to create it, but fail
    #end

    #describe 'logged on' do
      #login_with_permissions(["newsletter"])
      ## Then create it
    #end
  #end
end
