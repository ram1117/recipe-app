require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  describe 'GET /shopping_lists' do
    before :each do
      @user = User.first
      sign_in @user
    end

    after :each do
      sign_out @user
    end
    it 'GET /users/shopping_lists/index' do
      get user_shopping_lists_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders correct template' do
      get user_shopping_lists_path(user_id: @user.id)
      expect(response).to render_template 'shopping_lists/index'
    end

    it 'response body has placeholder text' do
      get user_shopping_lists_path(user_id: @user.id)
      expect(response.body).to include('You need the following items')
    end
  end
end
