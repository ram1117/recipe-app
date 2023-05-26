require 'rails_helper'

RSpec.describe 'RecipeFood#New', type: :system do
  before :each do
    @user = User.first
    @recipe = @user.recipes.first
    @recipe_food = @recipe.recipe_foods.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit new_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id)
    expect(page).to have_content('Add new Ingredient')
  end

  it 'submit form redirects to recipe page' do
    visit new_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id)
    fill_in 'new_recipe_food_qty', with: 5
    select('potatoes', from: 'new_recipe_food_food_id')
    find('input[name="commit"]').click
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/recipes/#{@recipe.id}"
  end

  it "click 'Add Food Item' redirects to Food#New page" do
    visit new_user_recipe_recipe_food_path(user_id: @user.id, recipe_id: @recipe.id)
    click_link('Add Food Item')
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/foods/new"
  end
end
