require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do
  describe 'GET #index' do
    it 'renders the Newsletters index' do
      get :index
      expect(response).to render_template :index
    end
  end
end
