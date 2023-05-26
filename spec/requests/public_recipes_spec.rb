require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  before :each do
    @user = User.first
    sign_in @user
  end

  after :each do
    sign_out @user
  end

  describe 'GET /puclic_recipes/index' do
    it 'is valid response' do
      get public_recipes_path
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get public_recipes_path
      expect(response).to render_template 'public_recipes/index'
    end
    it 'response body has placeholder text' do
      get public_recipes_path
      expect(response.body).to include('Public Recipes')
    end
  end
end
