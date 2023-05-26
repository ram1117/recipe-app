require 'rails_helper'

RSpec.describe 'Recipe#New', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit new_user_recipe_path(user_id: @user.id)
    expect(page).to have_content('Add new recipe')
  end

  it 'submit form redirects to user recipes page' do
    visit new_user_recipe_path(user_id: @user.id)
    fill_in 'new_recipe_name', with: 'Recipe Food Title'
    fill_in 'new_recipe_preparation_time', with: 0.75
    fill_in 'new_recipe_cooking_time', with: 1.75
    fill_in 'new_recipe_description',
            with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut'
    find('input[name="commit"]').click
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/recipes"
  end
end
