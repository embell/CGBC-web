require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'renders the Home view' do
      get :home
      response.should render_template :home
    end
  end

  describe 'GET #history' do
    it 'renders the History view' do
      get :history
      response.should render_template :history
    end
  end

  describe 'GET #contact' do
    it 'renders the Contact view' do
      get :contact
      response.should render_template :contact
    end
  end
end
