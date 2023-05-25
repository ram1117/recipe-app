require 'rails_helper'

RSpec.describe 'Recipe#Index', type: :system do
  before :each do
    @user = User.first
    @recipe = @user.recipes.first
    login_as(@user, scope: :user)
  end
  it 'has list of recipes' do
    visit user_recipes_path(user_id: @user.id)
    recipes = page.all('.recipes-list-item')
    expect(recipes.length).to eql 2
  end

  it 'clicking recipe redirects to recipe details page' do
    visit user_recipes_path(user_id: @user.id)
    click_link('Banana bread')
    sleep 2
    expect(current_path).to eql("/users/#{@user.id}/recipes/#{@recipe.id}")
  end
  it "clicking 'remove' button removes the recipe" do
    visit user_recipes_path(user_id: @user.id)
    first(:button, 'Remove').click
    sleep 1
    recipes = page.all('.recipes-list-item')
    expect(recipes.length).to eql 1
  end
end
