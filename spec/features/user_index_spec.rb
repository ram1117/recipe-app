require 'rails_helper'

RSpec.describe 'Users#Index', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit users_path(user_id: @user.id)
    expect(page).to have_content('Add food items')
    expect(page).to have_content('View your Recipes')
  end

  it "click 'food items' link redirects to Foods#Index page" do
    visit users_path(user_id: @user.id)
    click_link('Food Items')
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/foods"
  end

  it "click 'recipes' link redirects to Recipes#Index page" do
    visit users_path(user_id: @user.id)
    click_link('Recipes')
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/recipes"
  end

  it "click 'public recipes' link redirects to PublicRecipes#Index page" do
    visit users_path(user_id: @user.id)
    click_link('Public Recipes')
    sleep 2
    expect(current_path).to eql '/public_recipes'
  end

  it "click 'Create New Recipe' link redirects to Recipes#New page" do
    visit users_path(user_id: @user.id)
    click_link('New Recipe')
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/recipes/new"
  end
end
