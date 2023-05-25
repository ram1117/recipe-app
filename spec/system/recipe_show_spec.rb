require 'rails_helper'

RSpec.describe 'Recipe#Index', type: :system do
  before :each do
    @user = User.first
    @recipe = @user.recipes.first
    @recipe_food = @recipe.recipe_foods.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit user_recipe_path(user_id: @user.id, id: @recipe.id)
    expect(page).to have_content('Recipe Banana bread')
  end

  it "click 'add ingredient' redirects to RecipeFood#new page" do
    visit user_recipe_path(user_id: @user.id, id: @recipe.id)
    find(:button, 'Add ingredient').click
    sleep 2
    expect(current_path).to eql("/users/#{@user.id}/recipes/#{@recipe.id}/recipe_foods/new")
  end

  it "clicking 'generate shopping list' redirects to ShoppingList#index page" do
    visit user_recipe_path(user_id: @user.id, id: @recipe.id)
    find(:button, 'Generate shopping list').click
    sleep 2
    expect(current_path).to eql("/users/#{@user.id}/shopping_lists")
  end

  it "clicking 'modify' redirects to RecipeFood#edit page" do
    visit user_recipe_path(user_id: @user.id, id: @recipe.id)
    first('a', text: 'Modify').click
    sleep 2
    expect(current_path).to eql("/users/#{@user.id}/recipes/#{@recipe.id}/recipe_foods/#{@recipe_food.id}/edit")
  end

  it "clicking 'delete' removes recipe food from the table" do
    visit user_recipe_path(user_id: @user.id, id: @recipe.id)
    first('a', text: 'Delete').click
    sleep 1
    # table = page.find(:css, 'table#my_table_id')
    row_count = all('.ingredients-table tr').count
    expect(row_count).to eql 2
  end
end
