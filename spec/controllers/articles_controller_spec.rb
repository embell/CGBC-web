require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'renders the Articles index' do
      get :index
      expect(response).to render_template :index
    end
  end
end
