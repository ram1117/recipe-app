require 'rails_helper'

RSpec.describe 'RecipeFood#Edit', type: :system do
  before :each do
    @user = User.first
    @recipe = @user.recipes.first
    @recipe_food = @recipe.recipe_foods.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit edit_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id, id: @recipe_food.id)
    expect(page).to have_content('Modify Ingredient')
  end

  it 'submit form redirects to recipe page' do
    visit edit_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id, id: @recipe_food.id)
    fill_in 'update_recipe_food_qty', with: 8
    find('input[name="commit"]').click
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/recipes/#{@recipe.id}"
  end
end
