require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do
  describe 'GET #index' do
    it 'renders the Newsletters index' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'when logged off' do
      it 'redirects' do
        post :create

        expect(response.status).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged on without newsletter permission' do
      login_with_permissions(["sermons"])

      it 'will not upload a new record' do
        initial_newsletter_count = Newsletter.count
        post :create, newsletter: { date: Time.now, document: fixture_file_upload('test.txt') }

        expect(flash[:error]).to match(/You do not have permission to edit Newsletters/)
        expect(Newsletter.count).to eq(initial_newsletter_count)
      end
    end

    context 'when logged on with newsletter permission' do
      login_with_permissions(["newsletters"])

      context 'and using valid parameters' do
        it 'successfully creates a new record' do
          initial_newsletter_count = Newsletter.count
          post :create, newsletter: { date: Time.now, document: fixture_file_upload('test.txt') }

          # Check error messages first, so that failing tests will show them
          expect(flash[:error]).to eq(nil)
          expect(Newsletter.count).to eq(initial_newsletter_count + 1)
        end

        it 'redirects to Newsletter index' do
          post :create, newsletter: { date: Time.now, document: fixture_file_upload('test.txt') }
          expect(response.status).to redirect_to(:newsletter)
        end
      end

      context 'with invalid parameters' do
        it 'causes an error' do
          bypass_rescue
          expect { post :create }.to raise_error(ActionController::ParameterMissing)
        end
      end
    end
  end
end
