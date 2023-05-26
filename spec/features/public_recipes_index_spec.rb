require 'rails_helper'

RSpec.describe 'PublicRecipes#Index', type: :system do
  before :each do
    @user = User.first
    @recipe = Recipe.last
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit public_recipes_path
    expect(page).to have_content('Public Recipes')
  end

  it 'clicking a recipe redirects to recipe details page' do
    visit public_recipes_path
    find_link('Salade Niçoise').click
    sleep 2
    expect(current_path).to eql "/users/#{@recipe.user.id}/recipes/#{@recipe.id}"
  end
end
