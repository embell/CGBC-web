require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do
  describe 'GET #index' do
    it 'renders the Newsletters index' do
      get :index
      response.should render_template :index
    end
  end
end
