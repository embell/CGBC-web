require 'rails_helper'

RSpec.describe SermonsController, type: :controller do
  describe 'GET #index' do
    it 'renders the Sermons index' do
      get :index
      response.should render_template :index
    end
  end
end
