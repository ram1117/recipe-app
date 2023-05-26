require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Test recipe', preparation_time: 10.2, cooking_time: 20.3,
                            description: 'Test description', public: true, user_id: @user.id)

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  scenario 'displays public recipes' do
    visit public_recipes_path
    expect(page).to have_content('Public Recipes')
    expect(page).to have_link(@recipe.name, href: user_recipe_path(user_id: @user.id, id: @recipe.id))
    expect(page).to have_content("By: #{@user_name}")
    expect(page).to have_content('Total food items')
    expect(page).to have_content('Total price')
  end
end
