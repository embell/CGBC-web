require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do
  describe 'GET #index' do
    it 'renders the Newsletters index' do
      get :index
      expect(response).to render_template :index
    end

    it 'prepares newsletters sorted by year' do
      n1 = Newsletter.create!({ date: Time.new(2015, 7,  1), document: fixture_file_upload('test.txt') })
      n2 = Newsletter.create!({ date: Time.new(2017, 2,  3), document: fixture_file_upload('test.txt') })
      n3 = Newsletter.create!({ date: Time.new(2012, 12, 5), document: fixture_file_upload('test.txt') })
      n4 = Newsletter.create!({ date: Time.new(2017, 9, 10), document: fixture_file_upload('test.txt') })

      get :index

      expect(assigns(:news_by_year)).to eq({ 2017 => [n2, n4], 2015 => [n1], 2012 => [n3] })

      Newsletter.delete_all
    end
  end

  describe 'POST #create' do
    context 'when logged off' do
      it 'redirects to login' do
        post :create

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged on without newsletter permission' do
      login_with_permissions([:sermons])

      it 'will not upload a new record' do
        initial_newsletter_count = Newsletter.count
        post :create, newsletter: { date: Time.now, document: fixture_file_upload('test.txt') }

        expect(flash[:error]).to match(/You do not have permission to edit Newsletters/)
        expect(Newsletter.count).to eq(initial_newsletter_count)
      end
    end

    context 'when logged on with newsletter permission' do
      login_with_permissions([:newsletters])

      context 'and submitting valid parameters' do
        it 'successfully creates a new record' do
          initial_newsletter_count = Newsletter.count
          post :create, newsletter: { date: Time.now, document: fixture_file_upload('test.txt') }

          # Check error messages first, so that failing tests will show them
          expect(flash[:error]).to eq(nil)
          expect(Newsletter.count).to eq(initial_newsletter_count + 1)
        end

        it 'redirects to Newsletter index' do
          post :create, newsletter: { date: Time.now, document: fixture_file_upload('test.txt') }
          expect(response).to redirect_to(:newsletter)
        end
      end

      context 'and submitting invalid parameters' do
        it 'causes an error when parameters are missing' do
          bypass_rescue
          expect { post :create }.to raise_error(ActionController::ParameterMissing)
        end

        it 'redirects with error message when file is empty' do
          post :create, newsletter: { date: Time.now, document: nil}

          expect(flash[:error]).to match(/Document can't be blank/)
          expect(response).to redirect_to(:admin)
        end
        
        it 'redirects with error message when date is empty' do
          post :create, newsletter: { date: nil, document: fixture_file_upload('test.txt') }

          expect(flash[:error]).to match(/Date can't be blank/)
          expect(response).to redirect_to(:admin)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    pending 'will delete a record'
    pending 'will delete the file associated to a record'
    pending 'will not delete file if also associated to another record'
  end
end
