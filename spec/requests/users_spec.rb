require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        user.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the user' do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete user_url(user)
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create! valid_attributes
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
